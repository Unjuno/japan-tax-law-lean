import JapanTaxLaw.TaxFinance

/-
# TokyoAsCityDeeming — 特別とん譲与税法 第六条第一項（都を市とみなす）

Pinned source:
  Law id: 332AC0000000077
  Official title: 特別とん譲与税法
  Revision: 332AC0000000077_20010106_411AC0000000160
  Raw snapshot: data/raw/332AC0000000077_20010106_411AC0000000160.law.json
  sha256: c24ccc49c14a5d0e9f626f02635e3ee6d90587628e5aba803ca5e31a33bf112d
  Statutory article: 第六条 (art. 6), 第一項, 第二文
  Source path: LawBody[1]/MainProvision/MainProvision[6]/Article:6/Article#6/
               Paragraph#1/ParagraphSentence/Sentence#2
  Normative unit id: NORM|1a2cafd55f792102d5682dcc811260486c83126edbf8985d8a31d64c3eddb32f

原文逐語（pinned, verbatim, DEEMING）:
  「この場合においては、都を市とみなして、この法律の規定を適用する。」

Variable contract:
  A municipality kind is encoded as a Nat code:
    0 = 都 (Tokyo Metropolis), 1 = 市 (city),
    2 = 県 (other prefecture), 3 = 町/村 (town or village).
  `asCityCode 0 = 1` is the legal fiction 「都を市とみなして」; every other
  code is preserved by the second match arm. Unit: a discrete kind code;
  domain: Nat (0..3 are the pinned kinds; other values are caller-defined
  kinds left unchanged). The code numbers are kind tags, NOT statutory amounts
  (the clause itself contains no numeral).

Scope: ONLY the deeming substitution 「都を市とみなして」 is modelled. The
  condition that triggers this sentence (この場合), the grant amount, the
  application of the remaining provisions, and all other articles are NOT
  MODELLED. `asCityCode` does not assert that any grant follows.

Proofs use only `cases` and `rfl`; no `simp`, `omega`, `sorry`, `admit`, `axiom`
or `Classical.choice`.
-/

namespace JapanTaxLaw.TokyoAsCityDeeming

/-- 「都を市とみなして」: the fiction maps 都 (0) to 市 (1) and preserves all else. -/
def asCityCode : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

/-- 都 is deemed a city (kernel reduction only). -/
theorem tokyo_becomes_city : asCityCode 0 = 1 := rfl

/-- An existing city is unchanged by the fiction. -/
theorem city_preserved : asCityCode 1 = 1 := rfl

/-- Other prefectures are unchanged by the fiction. -/
theorem prefecture_preserved : asCityCode 2 = 2 := rfl

/-- The fiction is idempotent for every code. -/
theorem idempotent (c : Nat) : asCityCode (asCityCode c) = asCityCode c := by
  cases c <;> rfl

end JapanTaxLaw.TokyoAsCityDeeming
