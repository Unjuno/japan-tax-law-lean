import JapanTaxLaw.TaxFinance

/-
# InheritanceTax3RetirementAllowanceWithin3Years — pinned clause 「被相続人の死亡により相続人その他の者が当該被相続人に支給されるべきであつた退職手当金、功労金その他これらに準ずる給与（政令で定める給付を含む。）で被相続人の死亡後三年以内に支給が確定したものの支給を受けた場合においては、当該給与の支給を受けた者について、当該給与」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article 第三条 (Num 3), paragraph 1, item 2 (本則, MainProvision[0]), ItemSentence/Sentence#1.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|339e1c6391e8d960650f591239c4d75846c44428c868cb7af1346b14d910fd41.
Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:3/Article#3/Paragraph#1/Item#2/ItemSentence/Sentence#1.
原文逐語: 「被相続人の死亡により相続人その他の者が当該被相続人に支給されるべきであつた退職手当金、功労金その他これらに準ずる給与（政令で定める給付を含む。）で被相続人の死亡後三年以内に支給が確定したものの支給を受けた場合においては、当該給与の支給を受けた者について、当該給与」
Scope: ONLY the inclusive 三年以内 (3-year) window in which the retirement
allowance's payment must be fixed. The 政令で定める給付 delegation, the
支給を受けた者 subject, the remaining items of 第三条 and all other articles are
NOT MODELLED. No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3Years

open JapanTaxLaw.TaxFinance

/-- 三 — 以内 (inclusive, 3 years). -/
def threshold : Nat := 3

/-- 「被相続人の死亡後三年以内に支給が確定したもの」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 3)

end JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3Years
