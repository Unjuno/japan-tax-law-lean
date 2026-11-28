import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2_7AnnuityAtLeast10YearsInclusive — pinned clause 「当該契約に基づくイに定める個人に対する年金の支払は、当該年金の受取人の年齢が六十歳に達した日以後の日で当該契約で定める日以後十年以上の期間又は当該受取人が生存している期間にわたつて定期に行うものであることその他の政令で定める要件」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 314_2, paragraph 7.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|6174c8deca60247c032c2d041cdd5ac7b8f08f542b35f67913e9a49c0c78baa4.
原文逐語: 「当該契約に基づくイに定める個人に対する年金の支払は、当該年金の受取人の年齢が六十歳に達した日以後の日で当該契約で定める日以後十年以上の期間又は当該受取人が生存している期間にわたつて定期に行うものであることその他の政令で定める要件」
Scope: ONLY the 十年以上 (years >= 10) INCLUSIVE annuity payment period in 地方税法 art. 314_2(7). The 六十歳に達した日以後, the 生存している期間 alternative, the 政令で定める要件 and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusive

open JapanTaxLaw.TaxFinance

/-- 「十年以上」 — statutory threshold literal 10; INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := 10 <= years

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (10 <= years)

end JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusive
