import JapanTaxLaw.TaxFinance

/-
# LocalTax321_8TwoOrMoreShareholders — pinned clause 「当該前十年内事業年度に係る控除未済還付法人税額（当該他の法人に株主等が二以上ある場合には、当該控除未済還付法人税額を当該他の法人の発行済株式又は出資（当該他の法人が有する自己の株式又は出資を除く。）の総数又は総額で除し、これに当該法人の有する当該他の法人の株式又は出資の数又は金額を乗じて計算した金額）は、それぞれ当該控除未済還付法人税額に係る前十年内事業年度開始の日の属する当該法人の事業年度（当該法人の合併等事業年度開始の日以後に開始した当該被合併法人等の前十年内事業年度に係」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 321_8, paragraph 24.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|4d40303ff657ac98fdfe72ff76773d15a2f6d921c428e0bcec5a5331f60a171e.
原文逐語: 「当該前十年内事業年度に係る控除未済還付法人税額（当該他の法人に株主等が二以上ある場合には、当該控除未済還付法人税額を当該他の法人の発行済株式又は出資（当該他の法人が有する自己の株式又は出資を除く。）の総数又は総額で除し、これに当該法人の有する当該他の法人の株式又は出資の数又は金額を乗じて計算した金額）は、それぞれ当該控除未済還付法人税額に係る前十年内事業年度開始の日の属する当該法人の事業年度（当該法人の合併等事業年度開始の日以後に開始した当該被合併法人等の前十年内事業年度に係」
Scope: ONLY the 当該他の法人に株主等が二以上ある場合 (shareholders >= 2) INCLUSIVE floor for the 按分計算. 発行済株式・出資の総数・自己の株式の控除・控除未済還付法人税額の計算・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_8TwoOrMoreShareholders

open JapanTaxLaw.TaxFinance

/-- 「当該前十年内事業年度に係る控除未済還付法人税額（当該他の法人に株主等が二以上ある場合には、当該控除未済還付法人税額を当該他の法人の発行済株式又は出資（当該他の法人が有する自己の株式又は出資を除く。）の総数又は総額で除し、これに当該法人の有する当該他の法人の株式又は出資の数又は金額を乗じて計算した金額）は、それぞれ当該控除未済還付法人税額に係る前十年内事業年度開始の日の属する当該法人の事業年度（当該法人の合併等事業年度開始の日以後に開始した当該被合併法人等の前十年内事業年度に係」 — statutory threshold literal (2); INCLUSIVE boundary. -/
def inScope (shareholders : Nat) : Prop := shareholders >= 2

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (shareholders : Nat) : Bool := decide (shareholders >= 2)

end JapanTaxLaw.LocalTax321_8TwoOrMoreShareholders
