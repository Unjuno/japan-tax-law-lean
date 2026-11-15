import JapanTaxLaw.KanzeiGoods

/-!
# KanzeiGoods specification — independent restatement of
                      関税法 (Customs Act) Act art. 2 items 3-4
                      (外国貨物 / 内国貨物)

Source (pinned):
https://laws.e-gov.go.jp/law/329AC0000000061
Revision: 329AC0000000061_20260601_508AC0000000005
Amendment enforcement date: 2026-06-01 (CurrentEnforced)
Raw snapshot sha256: 1701272A2E4EAF434B6D953026C340EFA4E15B2CA952FC941EEEB676D32204EA

Act art. 2 items 3-4, verbatim from the pinned text:
  「外国貨物」とは、輸出の許可を受けた貨物及び外国から本邦に到着した貨物
  （外国の船舶により公海で採捕された水産物を含む。）で輸入が許可される前のものをいう。
  「内国貨物」とは、本邦にある貨物で外国貨物でないもの及び
  本邦の船舶により公海で採捕された水産物をいう。

This module restates the goods-classification definitions independently of the
implementation in KanzeiGoods.lean. It deliberately preserves the source text's
anti-exclusivity: a Japanese-vessel high-seas catch that is export-permitted is
both, and no clause in the Act excludes either limb.

Axiom discipline: proofs by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace KanzeiGoodsSpec

/-- Sufficient sources of an affirmative foreign-goods (item 3) or domestic-goods (item 4) judgment. -/
inductive KanzeiGoodsJudgment : KanzeiGoodsFacts → Prop where
  | foreignExport (f : KanzeiGoodsFacts)
      (h : f.exportCustomsPermitted = Verdict.yes) : KanzeiGoodsJudgment f
  | foreignArrival (f : KanzeiGoodsFacts)
      (h : f.foreignArrivedNotImportPermitted = Verdict.yes) : KanzeiGoodsJudgment f
  | domesticFirstTrack (f : KanzeiGoodsFacts)
      (hi : f.inJapan = Verdict.yes)
      (hn : isForeignGoods f = Verdict.no) : KanzeiGoodsJudgment f
  | domesticJapanCatch (f : KanzeiGoodsFacts)
      (h : f.japanVesselHighSeasCatch = Verdict.yes) : KanzeiGoodsJudgment f

end KanzeiGoodsSpec

open KanzeiGoodsSpec

/-- Spec → impl (foreign): an established judgment yields the affirmative foreign-goods verdict,
    or an affirmative domestic-goods verdict. -/
theorem spec_kanzei_goods_sound (f : KanzeiGoodsFacts)
    (h : KanzeiGoodsJudgment f) :
    (isForeignGoods f = Verdict.yes ∨ isDomesticGoods f = Verdict.yes) := by
  cases h with
  | foreignExport hE => exact Or.inl (kanzei_foreign_export_permitted_sufficient f hE)
  | foreignArrival hA => exact Or.inl (kanzei_foreign_arrival_sufficient f hA)
  | domesticFirstTrack hi hn => exact Or.inr (kanzei_domestic_first_track_sufficient f hi hn)
  | domesticJapanCatch hC => exact Or.inr (kanzei_domestic_japan_catch_sufficient f hC)

/-- Impl → spec (foreign, limb 1): export permission yields the export judgment. -/
theorem spec_kanzei_foreign_complete_export (f : KanzeiGoodsFacts)
    (h : f.exportCustomsPermitted = Verdict.yes) : KanzeiGoodsJudgment f :=
  KanzeiGoodsJudgment.foreignExport f h

/-- Impl → spec (foreign, limb 2): foreign arrival before import permit yields the arrival judgment. -/
theorem spec_kanzei_foreign_complete_arrival (f : KanzeiGoodsFacts)
    (h : f.foreignArrivedNotImportPermitted = Verdict.yes) : KanzeiGoodsJudgment f :=
  KanzeiGoodsJudgment.foreignArrival f h

/-- Impl → spec (domestic, first track): in Japan and not foreign yields the first-track judgment. -/
theorem spec_kanzei_domestic_complete_first_track (f : KanzeiGoodsFacts)
    (hi : f.inJapan = Verdict.yes) (hn : isForeignGoods f = Verdict.no) : KanzeiGoodsJudgment f :=
  KanzeiGoodsJudgment.domesticFirstTrack f hi hn

/-- Impl → spec (domestic, second track): Japanese-vessel high-seas catch yields the catch judgment. -/
theorem spec_kanzei_domestic_complete_japan_catch (f : KanzeiGoodsFacts)
    (h : f.japanVesselHighSeasCatch = Verdict.yes) : KanzeiGoodsJudgment f :=
  KanzeiGoodsJudgment.domesticJapanCatch f h

/-- Impl → spec (foreign): any affirmative foreign verdict is witnessed by a judgment. -/
theorem spec_kanzei_foreign_complete (f : KanzeiGoodsFacts)
    (h : isForeignGoods f = Verdict.yes) : KanzeiGoodsJudgment f := by
  rcases (kanzei_foreign_iff_either_limb_yes f).mp h with h1 | h2
  · exact KanzeiGoodsJudgment.foreignExport f h1
  · exact KanzeiGoodsJudgment.foreignArrival f h2

/-- Impl → spec (domestic): any affirmative domestic verdict is witnessed by a judgment. -/
theorem spec_kanzei_domestic_complete (f : KanzeiGoodsFacts)
    (h : isDomesticGoods f = Verdict.yes) : KanzeiGoodsJudgment f := by
  unfold isDomesticGoods at h
  rcases Verdict.or_eq_yes.mp h with hFirst | hCatch
  · rcases Verdict.and_eq_yes.mp hFirst with ⟨hi, hnot⟩
    have hn : isForeignGoods f = Verdict.no := Verdict.not_eq_yes.mp hnot
    exact KanzeiGoodsJudgment.domesticFirstTrack f hi hn
  · exact KanzeiGoodsJudgment.domesticJapanCatch f hCatch

end JapanTaxLaw
