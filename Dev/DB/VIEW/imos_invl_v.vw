create or replace force view imos_invl_v as
select g.stock_gru_c,
       g.prod_txts,
       g.prod_n,
       g.kn_n,
       g.batch_n,
       b.batch_typ,
       b.comp_batch_n,
       b.ref_c,
       b.status1_c,
       m.manu_d,
       a.free_d,
       b.destroy_d,
       g.quant_c,
       g.quant_stock_ava,
       s.stock_cs,
       s.quant_stock_eff,
       s.quant_stock_blocked,
       s.quant_stock_unchecked
from pela_stock_group g,
     pezx_mf_batch b,
     pezx_mf_anal_more m,
     pezx_mf_anal a,
     pela_stock s
where s.batch_key = b.batch_key
and   g.prod_n = s.prod_n
and   g.kn_n = s.kn_n
and   g.batch_n = s.batch_n
and   g.stock_gru_c = s.stock_gru_c
and   a.prod_n = b.prod_n
and   a.kn_n = b.kn_n
and   a.batch_n = b.batch_n
and   a.rec_n = (select max(a1.rec_n) 
                 from pezx_mf_anal a1
                 where a1.prod_n = g.prod_n 
                 and a1.kn_n = g.kn_n
                 and a1.batch_n = g.batch_n
                 and a1.release_d = (select max(a2.release_d) 
                                     from pezx_mf_anal a2
                                     where a2.prod_n = g.prod_n 
                                     and a2.kn_n = g.kn_n
                                     and a2.batch_n = g.batch_n))
and   a.release_d = (select max(a3.release_d)
                     from pezx_mf_anal a3
                     where a3.prod_n = g.prod_n 
                     and a3.kn_n = g.kn_n
                     and a3.batch_n = g.batch_n)
and a.prod_n = m.prod_n (+)
and a.kn_n = m.kn_n (+)
and a.batch_n = m.batch_n (+)
and a.anal_source = m.anal_source (+)
and a. rec_n = m.rec_n (+);

