// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function gerar_despesas(){
 //confirm("Msg Helow 2!!!!");

 var conta = $('#fin_conta').val();

 var nr_parcelas = $('#nr_parcela').val();
 var vl_parcelas = $('#vl_parcela').val();
 var dt_inicio = $('#dt_inicio').val();
 var despesa_id = $('#despesa_id').val();

     $.get("gerar_saida",{ conta: conta,
           nr_parcelas: nr_parcelas,vl_parcelas: vl_parcelas, dt_inicio: dt_inicio, despesa_id: despesa_id });
 }
