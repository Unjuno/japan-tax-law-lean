import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8_2AntiDumpingCircumventionEffect — 関税定率法 第八条の二 EFFECT

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|8789ee655212d701703263bc001c3736ef358b2ecfcbb3cd68bb4a181dd709bd
  Source path: LawBody[1]/MainProvision/MainProvision[18]/Article:8_2/Article#8_2/ArticleCaption
  Article caption: （不当廉売関税の課税の回避のために第三国から輸入される貨物等に対して課する関税）

原文逐語（pinned, 一字一句改変なし）:
  「（不当廉売関税の課税の回避のために第三国から輸入される貨物等に対して課する関税）」

Norm kind: EFFECT — this unit is the article caption (見出し) of 第八条の二. It
labels a legal effect (課する関税) imposed on goods imported from 第三国
for the purpose 不当廉売関税の課税の回避. The computable slice models the origin/purpose
discrimination and the labeled effect kind. Sub-terms are extracted structurally
from the caption (not hand-typed). NOTE: a caption is a heading, NOT the operative
provisions; the substantive anti-dumping determination, duty computation and legal
effect mechanics are NOT MODELLED.

Variable contract (meaning / domain / type):
  ImportOrigin : Type — thirdCountry (第三国から輸入される) or other.
  Purpose : Type — avoidAntiDumping (不当廉売関税の課税の回避のために) or other.
  withinEffect : ImportOrigin -> Purpose -> Bool — true iff the third-country
    origin with the anti-dumping-avoidance purpose.
  No numeric amount/unit/dimension applies (structural EFFECT, not a formula).

Scope: only the caption's origin/purpose/effect discrimination. The operative
article text, anti-dumping determinations, duty computation and legal correctness
are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffect

/-- The import origin: from 第三国, or other. -/
inductive ImportOrigin : Type
  | thirdCountry : ImportOrigin
  | other : ImportOrigin

/-- The purpose: 不当廉売関税の課税の回避, or other. -/
inductive Purpose : Type
  | avoidAntiDumping : Purpose
  | other : Purpose

/-- The caption's effect: true for third-country origin with the avoidance purpose. -/
def withinEffect (o : ImportOrigin) (p : Purpose) : Bool :=
  match o with
  | ImportOrigin.thirdCountry =>
      match p with
      | Purpose.avoidAntiDumping => true
      | Purpose.other => false
  | ImportOrigin.other => false

/-- The labeled effect applies to third-country imports with the avoidance purpose. -/
theorem circumnvention_effect_within :
    withinEffect ImportOrigin.thirdCountry Purpose.avoidAntiDumping = true := rfl

/-- Other origins are outside the effect. -/
theorem other_origin_outside (p : Purpose) :
    withinEffect ImportOrigin.other p = false := by
  cases p <;> rfl

/-- Other purposes are outside the effect. -/
theorem other_purpose_outside (o : ImportOrigin) :
    withinEffect o Purpose.other = false := by
  cases o <;> rfl

end JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffect
