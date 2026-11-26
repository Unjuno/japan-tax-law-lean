import JapanTaxLaw.TaxFinance

/-
# LocalTax24_5IncomeOver1_35M — pinned clause 「障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が百三十五万円を超える場合を除く。）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 24_5 (第二十四条の五).
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|ac3ff069691e424062010107efcc061dc75233df0113af5e9d7fac76fe9ea587.
原文逐語: 「障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が百三十五万円を超える場合を除く。）」
Scope: ONLY the を超え (strict lower bound) of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax24_5IncomeOver1_35M

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が百三十五万円を超える場合を除く。） (を超え, strict lower bound). -/
def threshold : Money := 1_350_000

/-- Strict statutory lower bound — を超え. -/
def lower : Money := threshold

/-- 「障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が百三十五万円を超える場合を除く。）」. -/
def inScope (amount : Money) : Prop := lower < amount

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (1_350_000 < amount)

end JapanTaxLaw.LocalTax24_5IncomeOver1_35M
