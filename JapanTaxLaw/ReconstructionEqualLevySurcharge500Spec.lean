import JapanTaxLaw.ReconstructionEqualLevySurcharge500

/-
# ReconstructionEqualLevySurcharge500Spec — 復興臨時特例法 第二条 第一項 の独立定式

Pinned: law 423AC0000000118, revision 423AC0000000118_20111202_000000000000000,
Article 2 Paragraph 1; needle 「…地方税法第三十八条の規定にかかわらず、同条に規定する額に五百円を加算した額とする。」

Independent restatement: the special per-capita standard rate is the cross-law
base plus a fixed 500 yen. Definitions below use their own numerals and no
implementation identifiers; bridges are separate.
-/

namespace JapanTaxLaw.ReconstructionEqualLevySurcharge500

/-- 独立定式: 五百円 = 500。 -/
def specSurcharge : Nat := 500

/-- 独立定式: 基本額 + 500 円。impl 識別子は使わない。 -/
def specSpecialRate (base : Nat) : Nat :=
  base + specSurcharge

theorem agreeSurcharge : surchargeYen = specSurcharge := by
  unfold surchargeYen specSurcharge
  rfl

theorem agreeRate (base : Nat) :
    specialStandardRate base = specSpecialRate base := by
  unfold specialStandardRate specSpecialRate
  rw [agreeSurcharge]

example : specSpecialRate 1000 = 1500 := by decide
example : specSpecialRate 0 = 500 := by decide

end JapanTaxLaw.ReconstructionEqualLevySurcharge500
