// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function gerar_faturamento(){
 //confirm("Msg Helow 2!!!!");

 var conta = $('#fin_conta').val();

 var nr_parcelas = $('#nr_parcela').val();
 var vl_parcelas = $('#vl_parcela').val();
 var dt_inicio = $('#dt_inicio').val();
 var contrato_id = $('#contrato_id').val();
 var inc_despesas = $('#inc_despesas').val();
 var inc_entradas = $('#inc_entradas').val();

     $.get("faturamento",{ conta: conta,
           nr_parcelas: nr_parcelas,vl_parcelas: vl_parcelas, dt_inicio: dt_inicio, contrato_id: contrato_id,
           inc_despesas: inc_despesas, inc_entradas: inc_entradas });
 }
