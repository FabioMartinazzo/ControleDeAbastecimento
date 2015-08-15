using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

using Abastecimento.Models;
using IntuitiveFramework.Models;

namespace Abastecimento.Relatorios
{
    public class CalcMedidorConsumo
    {
        private double? _lastMedidor;
        private VeiculoMotorista _lastEquipamento;

        public CalcMedidorConsumo()
        {
            this._lastMedidor = null;
        }

        public double getMedidorAtual(AbastecimentoPosto currentAbastecimento)
        {
            double tmpReturn = 0;

            if (this._lastEquipamento != currentAbastecimento.VeiculoMotorista)
                this._lastEquipamento = currentAbastecimento.VeiculoMotorista;
            else
                tmpReturn = currentAbastecimento.LeituraMedidor - (this._lastMedidor.Value);
            
            this._lastMedidor = currentAbastecimento.LeituraMedidor;

            return tmpReturn;
        }
    }

    public partial class AbastecimentoPeriodo : MandarParaImpressao
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime DataInicial = Convert.ToDateTime(Session["dataInicial"]);
            DateTime DataFinal   = Convert.ToDateTime(Session["dataFinal"]);

            Func<AbastecimentoPosto, bool> whereData = x => x.Data.Date >= DataInicial.Date &&
                                                            x.Data.Date <= DataFinal.Date;

            string tipoStr = "Todos";
            Func<AbastecimentoPosto, bool> whereTipo = x => true;
            if ((Session["Tipo"] != null) && (Session["Tipo"] != String.Empty))
            {
                int tipo = Convert.ToInt32(Session["Tipo"]);
                tipoStr = bdContext<AbastecimentoEntities>.Instance.BD.TipoVeiculo.
                                    Where(x => x.Id_TipoVeiculo == tipo).FirstOrDefault().Descricao;
                whereTipo = x => x.VeiculoMotorista.Id_TipoVeiculo == tipo;
            }

            string marcaStr = "Todas";
            Func<AbastecimentoPosto, bool> whereMarca = x => true;
            if ((Session["Marca"] != null) && (Session["Marca"] != String.Empty))
            {
                int marca = Convert.ToInt32(Session["Marca"]);
                marcaStr = bdContext<AbastecimentoEntities>.Instance.BD.Concessionaria.
                                    Where(x => x.Id_Concessionaria == marca).FirstOrDefault().Descricao;
                whereMarca = x => x.VeiculoMotorista.Id_Concessionaria == marca;
            }

            string modeloStr = "Todos";
            Func<AbastecimentoPosto, bool> whereModelo = x => true;
            if ((Session["Modelo"] != null) && (Session["Modelo"] != String.Empty))
            {
                int modelo = Convert.ToInt32(Session["Modelo"]);
                modeloStr = bdContext<AbastecimentoEntities>.Instance.BD.Veiculo.
                                      Where(x => x.Id_Veiculo == modelo).FirstOrDefault().Descricao;
                whereModelo = x => x.VeiculoMotorista.Id_Veiculo == modelo;
            }

            string equipamentoStr = "Todos";
            Func<AbastecimentoPosto, bool> whereEquipamento = x => true;
            if ((Session["Equipamento"] != null) && (Session["Equipamento"] != String.Empty))
            {
                int equipamento = Convert.ToInt32(Session["Equipamento"]);
                equipamentoStr = bdContext<AbastecimentoEntities>.Instance.BD.VeiculoMotorista.
                                           Where(x => x.Id_VeiculoMotorista == equipamento).FirstOrDefault().Placa;
                whereEquipamento = x => x.Id_VeiculoMotorista == equipamento;
            }

            Func<AbastecimentoPosto, bool> where = x => whereData(x) && whereTipo(x) && whereMarca(x) &&
                                                        whereModelo(x) && whereEquipamento(x);

            CalcMedidorConsumo calcMedidorConsumo = new CalcMedidorConsumo();

            IEnumerable<AbastecimentoPosto> abastecimentosPosto = bdContext<AbastecimentoEntities>.Instance.BD.
                                                                            AbastecimentoPosto.Where(where).
                                                                            OrderBy(x => x.VeiculoMotorista.TipoVeiculo.Descricao).
                                                                            ThenBy(x => x.VeiculoMotorista.Concessionaria.Descricao).
                                                                            ThenBy(x => x.VeiculoMotorista.Veiculo.Descricao).
                                                                            ThenBy(x => x.VeiculoMotorista.Placa).
                                                                            ThenBy(x => x.Id_VeiculoMotorista).
                                                                            ThenBy(x => x.Data);

            var abastecimentosFormated = abastecimentosPosto.Select(x => new
                                                                        {
                                                                            IdEquipamento = x.VeiculoMotorista.Id_VeiculoMotorista,
                                                                            Tipo = x.VeiculoMotorista.TipoVeiculo.Descricao,
                                                                            Marca = x.VeiculoMotorista.Concessionaria.Descricao,
                                                                            Modelo = x.VeiculoMotorista.Veiculo.Descricao,
                                                                            Equipamento = x.VeiculoMotorista.Placa,
                                                                            Data = x.Data,
                                                                            Posto = x.Posto.Descricao,
                                                                            Leitura = x.LeituraMedidor,
                                                                            Medidor = EnumHelper.GetDescription((Enums.Medidores)((int)x.VeiculoMotorista.Medidor)),
                                                                            Motorista = x.Motorista.Nome + " " + x.Motorista.Sobrenome,
                                                                            Combustivel = x.Combustivel.Descricao,
                                                                            Quantidade = x.Quantidade_Combustivel,
                                                                            MedidorDiferenca = calcMedidorConsumo.getMedidorAtual(x),
                                                                        }
                                                                    );


            reportAbastecimentoPeriodo.LocalReport.DataSources.Add(new ReportDataSource("AbastecimentosPeriodo", abastecimentosFormated));

            reportAbastecimentoPeriodo.LocalReport.SetParameters(
                                    new List<ReportParameter>() {
                                                                    new ReportParameter("DataInicial", Session["dataInicial"].ToString()), 
                                                                    new ReportParameter("DataFinal", Session["dataFinal"].ToString()), 
                                                                    new ReportParameter("Tipo", tipoStr), 
                                                                    new ReportParameter("Marca", marcaStr), 
                                                                    new ReportParameter("Modelo", modeloStr), 
                                                                    new ReportParameter("Equipamento", equipamentoStr), 
                                                                }
                                                               );

            reportAbastecimentoPeriodo.LocalReport.Refresh();

            base.Imprimir(ref reportAbastecimentoPeriodo, "AbastecimentoPorPeriodo");
        }
    }
}