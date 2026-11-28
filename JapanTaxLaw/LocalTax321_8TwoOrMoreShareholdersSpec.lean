import JapanTaxLaw.LocalTax321_8TwoOrMoreShareholders

/-
# LocalTax321_8TwoOrMoreShareholdersSpec — independent spec for 地方税法 Num 321_8/24

Needle 「当該前十年内事業年度に係る控除未済還付法人税額（当該他の法人に株主等が二以上ある場合には、当該控除未済還付法人税額を当該他の法人の発行済株式又は出資（当該他の法人が有する自己の株式又は出資を除く。）の総数又は総額で除し、これに当該法人の有する当該他の法人の株式又は出資の数又は金額を乗じて計算した金額）は、それぞれ当該控除未済還付法人税額に係る前十年内事業年度開始の日の属する当該法人の事業年度（当該法人の合併等事業年度開始の日以後に開始した当該被合併法人等の前十年内事業年度に係」.
The implementation uses `shareholders >= 2`; this independent spec states the
statutory INCLUSIVE boundary as `shareholders >= 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax321_8TwoOrMoreShareholders

open JapanTaxLaw.TaxFinance

def specInScope (shareholders : Nat) : Prop := shareholders >= 2

theorem agree_scope (shareholders : Nat) : inScope shareholders ↔ specInScope shareholders := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax321_8TwoOrMoreShareholders
