import JapanTaxLaw.LocalTax72_21SubsidiaryOver50Percent

/-
# LocalTax72_21SubsidiaryOver50PercentSpec — independent spec for 地方税法 Num 72_21/6/2

Needle 「当該内国法人の当該事業年度終了の時又は当該事業年度の前事業年度終了の時における特定子会社（当該内国法人が発行済株式又は出資（政令で定めるものを除く。）の総数又は総額の百分の五十を超える数の株式又は出資を直接又は間接に保有する他の法人をいう。）の株式又は出資で、それぞれの時において当該内国法人が保有するものの帳簿価額の合計額」.
The implementation uses `threshold < percent`; the independent spec states
the statutory STRICT lower bound as `50 < percent`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax72_21SubsidiaryOver50Percent

open JapanTaxLaw.TaxFinance

def specInScope (percent : Nat) : Prop := 50 < percent

theorem agree_scope (percent : Nat) : inScope percent ↔ specInScope percent := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_21SubsidiaryOver50Percent
