import JapanTaxLaw.TaxFinance

/-!
# LocalAllocationTaxEnforcementDate — 地方交付税法 附則（昭和三八年法律第二三号）第一条（施行期日）

Pinned source:
  Law id: 325AC0000000211
  Law number: 昭和二十五年法律第二百十一号
  Revision: 325AC0000000211_20261102_508AC0000000062
  Raw snapshot: data/raw/325AC0000000211_20261102_508AC0000000062.law.json
  sha256: 151df453a55442acb1cdca91f420bc5f7b04b914b85d86b575311ff6e3a7cd95
  Normative unit id: NORM|fb5a0e940fe5c31e14cdc8f7832e98b1b6df531a1fc429e963161c0c838bceaf
  Source path (corrected after adversarial finding F3): top-level amendment-history
    附則 with AmendLawNum='昭和三八年三月二二日法律第二三号'
    / Article 第一条 (施行期日) / Paragraph Num=1 / Sentence#1.
  Statutory article: 附則 of the 1963 amendment act to 地方交付税法 — enforcement-date clause.

原文逐語（pinned, 一字一句改変なし）:
  「この法律は、公布の日から起算して九十日をこえない範囲内において政令で定める日から施行する。」

Provenance note (adversarial F1/F2/F3 fixed): law id 325AC0000000211 is
  **地方交付税法** (Local Allocation Tax Act), NOT 地方譲与税法. This clause is
  the 施行期日 provision of the 1963 amendment act (昭和三八年三月二二日法律第二三号)
  recorded in the law's amendment-history 附則; 「この法律」 denotes that amendment
  act. The needle appears exactly once in the pinned file. A whole-file
  (`file`-kind) audit check is used because `find_article_text` scopes to main
  provisions only and cannot locate an amendment-history 附則.

Variable contract:
  `promulgationDay : Nat` = 公布の日 (day index from a common origin), unit 日.
  `enforcementDay : Nat` = 政令で定める施行日 (set by cabinet order; opaque,
  caller-established), unit 日. `maxDelayDays : Nat := 90` = 九十日.
  The norm: enforcementDay must be at or after promulgation AND the delay must
  not exceed 90 days (「九十日をこえない範囲内」= delay ≤ 90, inclusive).

Scope: only this temporal bound + delegation-of-date relation of that amendment
act. The actual date chosen by cabinet order, the substantive local-allocation-tax
rules, other supplementary provisions and 政令 details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalAllocationTaxEnforcementDate

/-- 九十日. Unit 日; domain Nat. -/
def maxDelayDays : Nat := 90

/-- 「公布の日から起算して九十日をこえない範囲内において政令で定める日」:
    the enforcement day is at/after promulgation and the delay is ≤ 90 days. -/
def withinEnforcementRange (promulgationDay enforcementDay : Nat) : Prop :=
  promulgationDay ≤ enforcementDay ∧ enforcementDay - promulgationDay ≤ maxDelayDays

end JapanTaxLaw.LocalAllocationTaxEnforcementDate
