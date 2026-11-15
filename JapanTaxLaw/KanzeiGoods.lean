import JapanTaxLaw.Verdict
import JapanTaxLaw.VerdictLemmas

/-!
# KanzeiGoods — 関税法 (Customs Act)
                      Act art. 2 items 3-4
                      (definitions of "foreign goods" and "domestic goods")

Source (pinned):
https://laws.e-gov.go.jp/law/329AC0000000061
Law id: 329AC0000000061 (関税法; title 関税法)
Revision: 329AC0000000061_20260601_508AC0000000005
Amendment enforcement date: 2026-06-01 (CurrentEnforced)
Raw snapshot sha256: 1701272A2E4EAF434B6D953026C340EFA4E15B2CA952FC941EEEB676D32204EA
(as recorded in data/INVENTORY.json; see docs/INVENTORY.md)

Act art. 2, verbatim from the pinned text:
  「外国貨物」とは、輸出の許可を受けた貨物及び外国から本邦に到着した貨物
  （外国の船舶により公海で採捕された水産物を含む。）で輸入が許可される前のものをいう。
  「内国貨物」とは、本邦にある貨物で外国貨物でないもの及び
  本邦の船舶により公海で採捕された水産物をいう。
  前項第一号、第三号及び第四号に規定する公海で採捕された水産物には、
  本邦の排他的経済水域の海域及び外国の排他的経済水域の海域で採捕された水産物を含むものとする。
  （Act art. 2 para 2; this module does not distinguish the named seas, and does not model the deemed-import rule of Act art. 2 para 3.)

Scope:
* Only the goods-classification definitions of Act art. 2 items 3-4 are formalized.
* Paragraph 2 (EEZ high-seas aquatic products) is folded into the catch facts by construction:
  the high-seas-catch facts include catches in Japan's and foreign EEZ seas.
  The model does not distinguish the two seas.
* Paragraph 3 (deemed import for goods used/consumed in Japan before import) is not modelled.
* The assessment of facts is externally provided (Verdict inputs); this model never
  decides whether any cargo satisfies those facts in a real world.
* Act art. 2 items 1 (is/out import as act), 2, 4_2 (附帯税) and the remaining items are
  not part of this module.
* The four-valued `Verdict` logic is shared with StatutoryModel/CorpActor/Taxpayer;
  unknown is never treated as false.
* Note: 外国貨物 (item 3) and 内国貨物 (item 4) are NOT mutually exclusive under the text:
  a 本邦の船舶により公海で採捕された水産物 that is also export-permitted is both.
  The classification enum exposes `both`; no exclusivity theorem is claimed or proved.

Axiom discipline: proofs by `cases` + `simp` over Verdict constructors and the
Verdict connectives. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to the 関税法 Act art. 2 items 3-4 definitions. -/
structure KanzeiGoodsFacts where
  /-- 輸出の許可を受けた貨物である (item 3, first limb) -/
  exportCustomsPermitted : Verdict
  /-- 外国から本邦に到着した貨物で輸入が許可される前のものである
      (item 3, second limb; includes foreign-vessel high-seas aquatic products;
       EEZ aquatic products are included per Act art. 2 para 2) -/
  foreignArrivedNotImportPermitted : Verdict
  /-- 本邦にある貨物である (item 4, first limb) -/
  inJapan : Verdict
  /-- 本邦の船舶により公海で採捕された水産物である
      (item 4, second limb; EEZ catches included per Act art. 2 para 2) -/
  japanVesselHighSeasCatch : Verdict
  deriving DecidableEq, Repr

/-- Act art. 2 item 3 — 外国貨物: export-permitted cargo, or cargo arrived from abroad
    and not yet import-permitted. Either limb suffices ("及び…で輸入が許可される前のもの"
    reads the qualifier onto both conjuncts; both facts are independently documented). -/
def isForeignGoods (f : KanzeiGoodsFacts) : Verdict :=
  Verdict.or f.exportCustomsPermitted f.foreignArrivedNotImportPermitted

/-- Act art. 2 item 4 — 内国貨物: cargo in Japan that is not foreign goods,
    or aquatic products caught by a Japanese vessel on the high seas. -/
def isDomesticGoods (f : KanzeiGoodsFacts) : Verdict :=
  Verdict.or
    (Verdict.and f.inJapan (Verdict.not (isForeignGoods f)))
    f.japanVesselHighSeasCatch

/-- Goods classification combining the two definitions. -/
inductive KanzeiGoodsClassification where
  | foreignOnly
  | domesticOnly
  | both
  | neither
  | undetermined
  | inconsistent
  deriving DecidableEq, Repr

/-- Joint classification of cargo under Act art. 2 items 3-4.
    `.both` is genuinely possible: a cargo that is both export-permitted and
    Japanese-vessel high-seas catch satisfies both definitions; Act art. 2 does not
    make them exclusive, so the model surfaces `.both` rather than forcing a unique class. -/
def classifyKanzeiGoods (f : KanzeiGoodsFacts) : KanzeiGoodsClassification :=
  match isForeignGoods f, isDomesticGoods f with
  | .conflict, _ => .inconsistent
  | _, .conflict => .inconsistent
  | .yes, .no => .foreignOnly
  | .no, .yes => .domesticOnly
  | .yes, .yes => .both
  | .no, .no => .neither
  | .unknown, _ => .undetermined
  | _, .unknown => .undetermined

-- ==================== structural consistency lemmas ====================

/-- Export customs permission suffices for the foreign-goods verdict. -/
theorem kanzei_foreign_export_permitted_sufficient (f : KanzeiGoodsFacts)
    (h : f.exportCustomsPermitted = Verdict.yes) : isForeignGoods f = Verdict.yes := by
  unfold isForeignGoods
  rw [h]
  exact Verdict.or_yes_left _

/-- Arrival from abroad before import permit suffices for the foreign-goods verdict. -/
theorem kanzei_foreign_arrival_sufficient (f : KanzeiGoodsFacts)
    (h : f.foreignArrivedNotImportPermitted = Verdict.yes) : isForeignGoods f = Verdict.yes := by
  unfold isForeignGoods
  rw [h]
  exact Verdict.or_yes_right _

/-- Neither foreign-goods limb affirmed → not foreign goods. -/
theorem kanzei_foreign_no_of_both_no (f : KanzeiGoodsFacts)
    (hE : f.exportCustomsPermitted = Verdict.no)
    (hA : f.foreignArrivedNotImportPermitted = Verdict.no) : isForeignGoods f = Verdict.no := by
  unfold isForeignGoods
  rw [hE, hA]
  rfl

/-- Japanese-vessel high-seas catch suffices for the domestic-goods verdict. -/
theorem kanzei_domestic_japan_catch_sufficient (f : KanzeiGoodsFacts)
    (h : f.japanVesselHighSeasCatch = Verdict.yes) : isDomesticGoods f = Verdict.yes := by
  unfold isDomesticGoods
  rw [h]
  exact Verdict.or_yes_right _

/-- First-track sufficiency: cargo in Japan that is not foreign goods is domestic goods. -/
theorem kanzei_domestic_first_track_sufficient (f : KanzeiGoodsFacts)
    (hi : f.inJapan = Verdict.yes) (hn : isForeignGoods f = Verdict.no) :
    isDomesticGoods f = Verdict.yes := by
  unfold isDomesticGoods
  rw [hi, hn]
  exact Verdict.or_yes_left _

/-- Once cargo is foreign goods, the first domestic track is void, and the domestic
    verdict is exactly the Japanese-vessel high-seas-catch verdict. -/
theorem kanzei_domestic_of_foreign_yes (f : KanzeiGoodsFacts)
    (h : isForeignGoods f = Verdict.yes) :
    isDomesticGoods f = f.japanVesselHighSeasCatch := by
  unfold isDomesticGoods
  rw [h]
  cases f.inJapan <;> cases f.japanVesselHighSeasCatch <;> rfl

/-- Foreign-goods yes iff one limb yes ("及び…で輸入が許可される前のもの" conjoins or-joins). -/
theorem kanzei_foreign_iff_either_limb_yes (f : KanzeiGoodsFacts) :
    isForeignGoods f = Verdict.yes ↔
      (f.exportCustomsPermitted = Verdict.yes ∨
       f.foreignArrivedNotImportPermitted = Verdict.yes) := by
  rcases f with ⟨E, A, I, C⟩
  cases E <;> cases A <;> cases I <;> cases C <;> decide

/-- Joint classification is total and reaches every declared constructor. -/
theorem kanzei_goods_classification_total (f : KanzeiGoodsFacts) :
    classifyKanzeiGoods f = .foreignOnly ∨
    classifyKanzeiGoods f = .domesticOnly ∨
    classifyKanzeiGoods f = .both ∨
    classifyKanzeiGoods f = .neither ∨
    classifyKanzeiGoods f = .undetermined ∨
    classifyKanzeiGoods f = .inconsistent := by
  rcases f with ⟨E, A, I, C⟩
  cases E <;> cases A <;> cases I <;> cases C <;> decide

/-- A cargo can be both, by the text of Act art. 2 items 3-4:
    export-permitted (foreign goods) Japanese-vessel high-seas-catch aquatic product. -/
theorem kanzei_both_goods_possible (f : KanzeiGoodsFacts)
    (hE : f.exportCustomsPermitted = Verdict.yes)
    (hC : f.japanVesselHighSeasCatch = Verdict.yes) :
    classifyKanzeiGoods f = .both := by
  have hfg : isForeignGoods f = Verdict.yes :=
    kanzei_foreign_export_permitted_sufficient f hE
  have hdg : isDomesticGoods f = Verdict.yes :=
    kanzei_domestic_japan_catch_sufficient f hC
  simp [classifyKanzeiGoods, hfg, hdg]

end JapanTaxLaw
