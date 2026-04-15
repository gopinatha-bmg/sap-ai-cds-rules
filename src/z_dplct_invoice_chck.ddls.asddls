@AbapCatalog.sqlViewName: 'Z_DPLCT_INV'
@EndUserText.label: 'Duplicate Invoice Check'

define view Z_Dplct_Invoice_Chck
as select from bkpf
inner join bseg
on bkpf.belnr = bseg.belnr
and bkpf.bukrs = bseg.bukrs
and bkpf.gjahr = bseg.gjahr
{
  bkpf.bukrs,
  bseg.lifnr,
  bkpf.xblnr,
  bseg.dmbtr,
  bkpf.waers,
  bkpf.budat
}
where
  bkpf.budat >= dats_add_days( cast( $session.system_date as abap.dats ), -90 , 'NULL')
  and bkpf.stblg is initial
  and bseg.lifnr is not initial
  and bkpf.xblnr is not initial
