import JapanTaxLaw.ForeignAssetPenaltyCap

/-
# ForeignAssetPenaltyCapSpec — independent spec for 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等に関する法律 第十条

Pinned source:
  Law id: 409AC0000000110
  Official title: 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等に関する法律
  Law number: 平成九年法律第百十号
  Law type: Act (法律)
  Revision: 409AC0000000110_20260812_508AC0000000064
  Raw snapshot: data/raw/409AC0000000110_20260812_508AC0000000064.law.json
  sha256: b4440b62d96b6d2f0962a72c815ce075705da13530f625f1204d534313fc24ab
  Statutory article: 第十条 (raw JSON Article attr.Num = "10").

原文逐語:
  「正当な理由がなくて国外財産調書をその提出期限までに税務署長に提出しなかったときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constants
`specImpCap : Nat := 1` (一年) and `specFineCap : Nat := 50` (五十万円) and
expresses the two INCLUSIVE caps with its own `spec*` functions. No
implementation identifier (`imprisonmentCapYears`, `fineCapManYen`,
`withinImprisonmentCap`, `withinFineCap`, `penaltyWithinCaps`) occurs in any
independent `spec*` definition; the agreement theorems are not independent
formulas. The two axes are dimensionally distinct: years (年) and manYen (万円).

Variable contract: years = 拘禁刑の期間 (Nat, 年), manYen = 罰金 (Nat, 万円,
1 万円 = 10,000 円); 一年以下 = years <= 1 INCLUSIVE; 五十万円以下 = manYen <= 50
INCLUSIVE. Only the cap conditions of the penalty provision are modelled.

All bridges are pure `unfold ... ; rfl` reductions, nothing more.
-/

namespace JapanTaxLaw.ForeignAssetPenaltyCap

/-- Independent constant: 一年 = 1 年 (unit 年, Nat). -/
def specImpCap : Nat := 1

/-- Independent constant: 五十万円 = 50 万円 (unit 万円, Nat). -/
def specFineCap : Nat := 50

/-- Independent 「一年以下」: years <= specImpCap (inclusive). -/
def specImp (years : Nat) : Bool :=
  decide (years <= specImpCap)

/-- Independent 「五十万円以下」: manYen <= specFineCap (inclusive). -/
def specFine (manYen : Nat) : Bool :=
  decide (manYen <= specFineCap)

/-- Independent DUAL cap: both dimensionally distinct axes must hold. -/
def specPenalty (years : Nat) (manYen : Nat) : Bool :=
  specImp years && specFine manYen

theorem agreeImpCap : imprisonmentCapYears = specImpCap := by
  unfold imprisonmentCapYears specImpCap
  rfl

theorem agreeFineCap : fineCapManYen = specFineCap := by
  unfold fineCapManYen specFineCap
  rfl

theorem agreeImp (years : Nat) : withinImprisonmentCap years = specImp years := by
  unfold withinImprisonmentCap specImp imprisonmentCapYears specImpCap
  rfl

theorem agreeFine (manYen : Nat) : withinFineCap manYen = specFine manYen := by
  unfold withinFineCap specFine fineCapManYen specFineCap
  rfl

theorem agreePenalty (years : Nat) (manYen : Nat) : penaltyWithinCaps years manYen = specPenalty years manYen := by
  unfold penaltyWithinCaps specPenalty withinImprisonmentCap withinFineCap specImp specFine imprisonmentCapYears fineCapManYen specImpCap specFineCap
  rfl

end JapanTaxLaw.ForeignAssetPenaltyCap
