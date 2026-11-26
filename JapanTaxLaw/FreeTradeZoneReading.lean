import JapanTaxLaw.TaxFinance

/-
# FreeTradeZoneReading — 沖縄地方税課税免除省令 第一条第二項（自由貿易地域等の準用）

Pinned source:
  Law id: 404M50000008008
  Official title: 沖縄振興開発特別措置法第十五条等の地方税の課税免除又は不均一課税に伴う措置が適用される場合を定める省令
  Revision: 404M50000008008_20020301_414M60000008019
  Raw snapshot: data/raw/404M50000008008_20020301_414M60000008019.law.json
  Article: 第一条 (art. 1), 第二項, 第一文
  Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#2/ParagraphSentence/Sentence#1
  Normative unit id: NORM|1ee9f2af617374e26dd0513f322c71bdc1a5653d81fff74fdeadb269b5bb8666

原文逐語（pinned, verbatim, READING）:
  「前項の規定は、自由貿易地域及び特別自由貿易地域について準用する。」

Variable contract:
  A region code is a Nat: 0 = 自由貿易地域, 1 = 特別自由貿易地域,
  2+ = other regions. `asListedZone` returns 1 (a listed zone for which 前項
  applies) for codes 0 and 1, and 0 (not listed) otherwise.
  Unit: a discrete region tag; domain: Nat.

Scope: ONLY the selection of 自由貿易地域 and 特別自由貿易地域 for the
mutatis-mutandis application (準用) of 前項 is modelled. The content of 前項,
the tax exemption itself and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.FreeTradeZoneReading

/-- 「自由貿易地域及び特別自由貿易地域について準用する」: both are listed zones. -/
def asListedZone : Nat → Nat
  | 0 => 1
  | 1 => 1
  | Nat.succ (Nat.succ _) => 0

theorem free_zone_listed : asListedZone 0 = 1 := rfl

theorem special_zone_listed : asListedZone 1 = 1 := rfl

theorem other_zone_not_listed : asListedZone 2 = 0 := rfl

end JapanTaxLaw.FreeTradeZoneReading
