import JapanTaxLaw.KanzeiGoods

/-!
# KanzeiGoods tests — 関税法 Act art. 2 items 3-4 smoke checks

Decidable smoke checks for the goods-classification (外国貨物 / 内国貨物) model.
These call the model with concrete facts and `decide` the verdicts.
-/

namespace JapanTaxLaw

-- 外国貨物: export-permitted suffices
example : isForeignGoods
    { exportCustomsPermitted := .yes, foreignArrivedNotImportPermitted := .no,
      inJapan := .yes, japanVesselHighSeasCatch := .no } = Verdict.yes := by decide

-- 外国貨物: arrived from abroad before import permit suffices
example : isForeignGoods
    { exportCustomsPermitted := .no, foreignArrivedNotImportPermitted := .yes,
      inJapan := .yes, japanVesselHighSeasCatch := .no } = Verdict.yes := by decide

-- 外国貨物: neither limb yes ⇒ not foreign goods
example : isForeignGoods
    { exportCustomsPermitted := .no, foreignArrivedNotImportPermitted := .no,
      inJapan := .yes, japanVesselHighSeasCatch := .no } = Verdict.no := by decide

-- 外国貨物: unknown limbs stay unknown (unknown is never false)
example : isForeignGoods
    { exportCustomsPermitted := .unknown, foreignArrivedNotImportPermitted := .unknown,
      inJapan := .yes, japanVesselHighSeasCatch := .no } = Verdict.unknown := by decide

-- 内国貨物: Japanese-vessel high-seas catch suffices regardless of foreign verdict
example : isDomesticGoods
    { exportCustomsPermitted := .yes, foreignArrivedNotImportPermitted := .yes,
      inJapan := .no, japanVesselHighSeasCatch := .yes } = Verdict.yes := by decide

-- 内国貨物: in Japan and not foreign ⇒ domestic
example : classifyKanzeiGoods
    { exportCustomsPermitted := .no, foreignArrivedNotImportPermitted := .no,
      inJapan := .yes, japanVesselHighSeasCatch := .no } = .domesticOnly := by decide

-- 内国貨物: foreign goods with no Japan catch is not domestic
example : classifyKanzeiGoods
    { exportCustomsPermitted := .no, foreignArrivedNotImportPermitted := .yes,
      inJapan := .yes, japanVesselHighSeasCatch := .no } = .foreignOnly := by decide

-- Both: export-permitted Japanese-vessel catch is both (Act does not exclude)
example : classifyKanzeiGoods
    { exportCustomsPermitted := .yes, foreignArrivedNotImportPermitted := .no,
      inJapan := .yes, japanVesselHighSeasCatch := .yes } = .both := by decide

-- Neither
example : classifyKanzeiGoods
    { exportCustomsPermitted := .no, foreignArrivedNotImportPermitted := .no,
      inJapan := .no, japanVesselHighSeasCatch := .no } = .neither := by decide

-- Conflict ⇒ inconsistent
example : classifyKanzeiGoods
    { exportCustomsPermitted := .conflict, foreignArrivedNotImportPermitted := .no,
      inJapan := .no, japanVesselHighSeasCatch := .no } = .inconsistent := by decide

-- Unknown ⇒ undetermined
example : classifyKanzeiGoods
    { exportCustomsPermitted := .unknown, foreignArrivedNotImportPermitted := .no,
      inJapan := .no, japanVesselHighSeasCatch := .no } = .undetermined := by decide

-- Foreign verdict computationally depends on catch when foreign holds
example : isDomesticGoods
    { exportCustomsPermitted := .yes, foreignArrivedNotImportPermitted := .no,
      inJapan := .yes, japanVesselHighSeasCatch := .no } = Verdict.no := by decide
example : isDomesticGoods
    { exportCustomsPermitted := .yes, foreignArrivedNotImportPermitted := .no,
      inJapan := .yes, japanVesselHighSeasCatch := .yes } = Verdict.yes := by decide

end JapanTaxLaw
