import JapanTaxLaw.TaxFinance

/-
# CustomsItExceptionPromptEffective — 税関手続特例法改正政令 附則第一条（第十三条は公布日施行）

Pinned source:
  Law id: 420CO0000000210
  Official title: 電子情報処理組織による税関手続の特例等に関する法律の一部を改正する法律の施行に伴う関係政令の整備及び経過措置に関する政令
  Law type: CabinetOrder (政令)
  Revision: 420CO0000000210_20081001_000000000000000
  Raw snapshot: data/raw/420CO0000000210_20081001_000000000000000.law.json
  sha256: 499b4ac13b48680b72086379f1ac73f2db709d43f1db1197e838c10f7fa6aaba
  Statutory article: 附則 第一条 (Supplementary Provision art. 1), proviso (ただし書)
  Source path: LawBody[4]/SupplProvision/SupplProvision[1]/Article:1/Article#1/
               Paragraph#1/ParagraphSentence/Sentence#2
  Normative unit id: NORM|efa09d98292a1de5055d9a7bdf08343c4d14f2f9bf9e64ad90a5bd4ddf492e34

原文逐語（pinned, 一字一句改変なし, EXCEPTION, verbatim-unique in whole law）:
  「ただし、第十三条の規定は、公布の日から施行する。」

Variable contract:
  `delayDays : Nat` is the number of days after promulgation before a provision
  takes effect. This proviso gives article 13 ZERO delay (公布の日から施行).
  `isPromptEffective (delayDays : Nat) : Bool := decide (delayDays == 0)`.
  Unit 日 (days); domain Nat.

Scope: ONLY the zero-delay temporal exception for article 13 is modelled. The
general deferred-effective rule for other articles, article 13's substantive
content and other supplementary articles are NOT MODELLED (caller-established).
The source numeral is absent; an explicit independent check records this.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsItExceptionPromptEffective

/-- Zero delay: effective on the day of promulgation. -/
def promptDelayDays : Nat := 0

/-- 「公布の日から施行する」: no delay after promulgation. -/
def isPromptEffective (delayDays : Nat) : Bool :=
  decide (delayDays == promptDelayDays)

theorem zero_delay_true : isPromptEffective 0 = true := by
  unfold isPromptEffective promptDelayDays
  decide

theorem one_day_false : isPromptEffective 1 = false := by
  unfold isPromptEffective promptDelayDays
  decide

theorem two_days_false : isPromptEffective 2 = false := by
  unfold isPromptEffective promptDelayDays
  decide

end JapanTaxLaw.CustomsItExceptionPromptEffective
