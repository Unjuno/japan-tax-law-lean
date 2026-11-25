import Std
import JapanTaxLaw.TaxFinance
import JapanTaxLaw.PerCapitaEqualRate

/-
# ReconstructionEqualLevySurcharge500 — 東日本大震災復興臨時特例法 第二条 第一項
（個人の道府県民税 均等割の標準税率：地方税法第三十八条の額に五百円を加算）

Pinned sources:
  Law id: 423AC0000000118 (東日本大震災からの復興に関し地方公共団体が実施する
    防災のための施策に必要な財源の確保に係る地方税の臨時特例に関する法律)
  Revision: 423AC0000000118_20111202_000000000000000 (CurrentEnforced)
  Raw snapshot: data/raw/423AC0000000118_20111202_000000000000000.law.json
  Article Num 2, Paragraph Num 1, Sentence 1.
  source_path: LawBody[1]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/ParagraphSentence/Sentence
  Normative unit: NORM|0b4a9ed5b8915f7c64ef1465afe249e677410bbd81c8fea36cde219317811c45

Verbatim 原文 needle (scoped to Article 2 Paragraph 1):
  「平成二十六年度から平成三十五年度までの各年度分の個人の道府県民税に限り、均等割の標準税率は、地方税法第三十八条の規定にかかわらず、同条に規定する額に五百円を加算した額とする。」

Variable contract:
  base = 地方税法第三十八条に規定する額 (caller-established, 円)
  surcharge = 五百円 = 500 円
  specialStandardRate base = base + surcharge

「にかかわらず」 is a genuine statutory override of the cross-law base; this
model adds the fixed yen surcharge to a caller-established base and proves the
reconstructed value for the pinned 地方税法 38条 base (千円 = 1000) from
JapanTaxLaw.PerCapitaEqualRate.standardRate. The cross-law dependency is
law 325AC0000000226 / article 38 / enforced 2026-11-01.

Scope: ONLY this additive override and the FY26–FY35 道府県民税 applicability
window recorded as a condition. Paragraph 2 (市町村民税), the ¥1,000 base
derivation itself, 所得割, 制限税率, 条例変更, 端数処理, assessment/collection
and other articles are NOT MODELLED. No rounding rule is introduced.
-/

namespace JapanTaxLaw.ReconstructionEqualLevySurcharge500

/-- 原文の「五百円」= 500 円。 -/
def surchargeYen : Nat := 500

/-- 特例標準税率 = 地方税法38条の額 + 500 円。 -/
def specialStandardRate (base : Nat) : Nat :=
  base + surchargeYen

theorem surcharge_is_500 : surchargeYen = 500 := rfl

/-- 基本額 1000 円（地方税法38条・PerCapitaEqualRate）との再構成。 -/
theorem reconstructed_standard_rate :
    specialStandardRate JapanTaxLaw.PerCapitaEqualRate.standardRate = 1500 := by
  decide

/-- 零ベース・小さい入力・additive 境界。 -/
theorem zero_base : specialStandardRate 0 = 500 := by decide
theorem threshold_below : specialStandardRate 499 = 999 := by decide
theorem threshold_at : specialStandardRate 500 = 1000 := by decide
theorem threshold_above : specialStandardRate 501 = 1001 := by decide

end JapanTaxLaw.ReconstructionEqualLevySurcharge500
