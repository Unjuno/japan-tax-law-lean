import JapanTaxLaw.TaxFinance

/-!
# BondedAreaKinds — 関税法 art.29（保税地域は五種とする）

Pinned source:
  Law id: 329AC0000000061
  Law number: 昭和二十九年法律第六十一号
  Revision: 329AC0000000061_20260601_508AC0000000005
  Raw snapshot: data/raw/329AC0000000061_20260601_508AC0000000005.law.json
  sha256: 1701272a2e4eaf434b6d953026c340efa4e15b2ca952fc941eeeb676d32204ea
  Normative unit id: NORM|82181433a122f927ffe22c13314bc4aa5d5b3e8df17fd13c98f2a46c498b47b0
  Source path: LawBody[3]/MainProvision/MainProvision[3]/Article:29/Article#29/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: art.29(1) — 保税地域の種別列挙（五種）

Law identity verified: INVENTORY official_title = 関税法;
raw JSON law_title = 関税法 (both checked).

原文逐語（pinned, 一字一句改変なし）:
  「保税地域は、指定保税地域、保税蔵置場、保税工場、保税展示場及び総合保税地域の五種とする。」

Variable contract:
  `BondedAreaKind` enumerates the five named kinds. `allKinds : List BondedAreaKind`
  lists them exactly once each. `kindCount : Nat := 5` records 「五種」. The
  computable claim is: the enumeration has exactly five distinct members and is
  exhaustive over the inductive's inhabitants — a boundary/cardinality check.

Scope: only the enumeration and its cardinality. The substantive definitions of
each bonded area, the 関税法 provisions governing them, other paragraphs and 政令
details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.BondedAreaKinds

/-- The five bonded-area kinds named in art.29. -/
inductive BondedAreaKind where
  | designatedBondedArea    -- 指定保税地域
  | bondedWarehouse         -- 保税蔵置場
  | bondedFactory           -- 保税工場
  | bondedExhibition        -- 保税展示場
  | comprehensiveBondedArea -- 総合保税地域
  deriving BEq, DecidableEq, Repr

/-- 五種: the statutory count. Unit: 種 (kinds); domain Nat. -/
def kindCount : Nat := 5

/-- The enumerated list of the five kinds. -/
def allKinds : List BondedAreaKind :=
  [ BondedAreaKind.designatedBondedArea,
    BondedAreaKind.bondedWarehouse,
    BondedAreaKind.bondedFactory,
    BondedAreaKind.bondedExhibition,
    BondedAreaKind.comprehensiveBondedArea ]

end JapanTaxLaw.BondedAreaKinds
