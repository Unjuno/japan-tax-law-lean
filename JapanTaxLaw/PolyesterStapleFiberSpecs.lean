import JapanTaxLaw.TaxFinance

/-
# PolyesterStapleFiberSpecs — ポリエステル短繊維に対して課する不当廉売関税に関する政令 第一条（課税物件）

Pinned source:
  Law id: 414CO0000000262
  Official title: ポリエステル短繊維に対して課する不当廉売関税に関する政令
  Law number: 平成十四年政令第二百六十二号
  Law type: CabinetOrder (政令)
  Revision: 414CO0000000262_20110401_423CO0000000088
  Raw snapshot: data/raw/414CO0000000262_20110401_423CO0000000088.law.json
  sha256: fcfc53577dfbe461896f26630df965f9dac64266a269ba4502bfe019a9bba874
  Article: 第一条 (attr.Num = "1"), caption （課税物件）.

原文逐語（pinned, 一字一句改変なし）:
  「法の別表第五五〇三・二〇号に掲げる合成繊維の短繊維（三・八八デシテックスを超え二十二・二三デシテックス未満のもので、かつ、長さが二十五ミリメートル以上八十ミリメートル以下のものに限る。以下「ポリエステル短繊維」という。）」

Variable contract (Nat; exact scaled integers, no floating point):
  f   = fineness in 1/100 dtex (デシテックス).
        三・八八 = 3.88 dtex -> 388; 二十二・二三 = 22.23 dtex -> 2223.
        「超え」= STRICT (>), 「未満」= STRICT (<): 388 < f && f < 2223.
  len = length in mm (ミリメートル).
        二十五 = 25 mm; 八十 = 80 mm.
        「以上」= INCLUSIVE (>=), 「以下」= INCLUSIVE (<=): 25 <= len && len <= 80.
  The two axes are dimensionally distinct (dtex vs mm) and are never mixed.

Scope: ONLY the two explicit physical bound conditions in the pinned needle.
The 別表第五五〇三・二〇号 tariff classification, the producing/exporting
countries or regions in the surrounding Article, the dumping determination,
and every other provision are NOT MODELLED. No legal review is provided.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PolyesterStapleFiberSpecs

/- 三・八八デシテックス = 3.88 dtex = 388 (1/100 dtex). -/
def finenessLow : Nat := 388

/- 二十二・二三デシテックス = 22.23 dtex = 2223 (1/100 dtex). -/
def finenessHigh : Nat := 2223

/- 二十五ミリメートル = 25 mm. -/
def lengthLow : Nat := 25

/- 八十ミリメートル = 80 mm. -/
def lengthHigh : Nat := 80

/- 三・八八を超え二十二・二三未満: both bounds STRICT. -/
def finenessInRange (f : Nat) : Bool :=
  decide (finenessLow < f && f < finenessHigh)

/- 二十五以上八十以下: both bounds INCLUSIVE. -/
def lengthInRange (len : Nat) : Bool :=
  decide (lengthLow <= len && len <= lengthHigh)

/- ポリエステル短繊維: fineness axis AND length axis. -/
def isPolyesterStaple (f len : Nat) : Bool :=
  finenessInRange f && lengthInRange len

/- Bounds are ordered — direct inequalities. -/
theorem fineness_bounds_ordered : finenessLow < finenessHigh := by
  unfold finenessLow finenessHigh
  omega

theorem length_bounds_ordered : lengthLow < lengthHigh := by
  unfold lengthLow lengthHigh
  omega

/- Explicit fineness boundary cases (超え / 未満 are strict). -/
theorem fineness_388_false : finenessInRange 388 = false := by
  unfold finenessInRange finenessLow finenessHigh
  have hn : ¬ 388 < 388 := by omega
  simp [hn]

theorem fineness_389_true : finenessInRange 389 = true := by
  unfold finenessInRange finenessLow finenessHigh
  have hlo : 388 < 389 := by omega
  have hhi : 389 < 2223 := by omega
  simp [hlo, hhi]

theorem fineness_2222_true : finenessInRange 2222 = true := by
  unfold finenessInRange finenessLow finenessHigh
  have hlo : 388 < 2222 := by omega
  have hhi : 2222 < 2223 := by omega
  simp [hlo, hhi]

theorem fineness_2223_false : finenessInRange 2223 = false := by
  unfold finenessInRange finenessLow finenessHigh
  have hn : ¬ 2223 < 2223 := by omega
  simp [hn]

theorem fineness_1000_true : finenessInRange 1000 = true := by
  unfold finenessInRange finenessLow finenessHigh
  have hlo : 388 < 1000 := by omega
  have hhi : 1000 < 2223 := by omega
  simp [hlo, hhi]

/- Explicit length boundary cases (以上 / 以下 are inclusive). -/
theorem length_25_true : lengthInRange 25 = true := by
  unfold lengthInRange lengthLow lengthHigh
  have hlo : 25 <= 25 := by omega
  have hhi : 25 <= 80 := by omega
  simp [hlo, hhi]

theorem length_80_true : lengthInRange 80 = true := by
  unfold lengthInRange lengthLow lengthHigh
  have hlo : 25 <= 80 := by omega
  have hhi : 80 <= 80 := by omega
  simp [hlo, hhi]

theorem length_24_false : lengthInRange 24 = false := by
  unfold lengthInRange lengthLow lengthHigh
  have hn : ¬ 25 <= 24 := by omega
  simp [hn]

theorem length_81_false : lengthInRange 81 = false := by
  unfold lengthInRange lengthLow lengthHigh
  have hn : ¬ 81 <= 80 := by omega
  simp [hn]

/- Combined cases: both axes must be satisfied simultaneously. -/
theorem combined_0_0_false : isPolyesterStaple 0 0 = false := by
  unfold isPolyesterStaple finenessInRange lengthInRange finenessLow finenessHigh lengthLow lengthHigh
  have hn : ¬ 388 < 0 := by omega
  simp [hn]

theorem combined_388_25_false : isPolyesterStaple 388 25 = false := by
  unfold isPolyesterStaple finenessInRange lengthInRange finenessLow finenessHigh lengthLow lengthHigh
  have hn : ¬ 388 < 388 := by omega
  simp [hn]

theorem combined_389_25_true : isPolyesterStaple 389 25 = true := by
  unfold isPolyesterStaple finenessInRange lengthInRange finenessLow finenessHigh lengthLow lengthHigh
  have hf1 : 388 < 389 := by omega
  have hf2 : 389 < 2223 := by omega
  have hl1 : 25 <= 25 := by omega
  have hl2 : 25 <= 80 := by omega
  simp [hf1, hf2, hl1, hl2]

theorem combined_2222_80_true : isPolyesterStaple 2222 80 = true := by
  unfold isPolyesterStaple finenessInRange lengthInRange finenessLow finenessHigh lengthLow lengthHigh
  have hf1 : 388 < 2222 := by omega
  have hf2 : 2222 < 2223 := by omega
  have hl1 : 25 <= 80 := by omega
  have hl2 : 80 <= 80 := by omega
  simp [hf1, hf2, hl1, hl2]

theorem combined_2223_80_false : isPolyesterStaple 2223 80 = false := by
  unfold isPolyesterStaple finenessInRange lengthInRange finenessLow finenessHigh lengthLow lengthHigh
  have hn : ¬ 2223 < 2223 := by omega
  simp [hn]

theorem combined_1000_81_false : isPolyesterStaple 1000 81 = false := by
  unfold isPolyesterStaple finenessInRange lengthInRange finenessLow finenessHigh lengthLow lengthHigh
  have hf1 : 388 < 1000 := by omega
  have hf2 : 1000 < 2223 := by omega
  have hn : ¬ 81 <= 80 := by omega
  simp [hf1, hf2, hn]

end JapanTaxLaw.PolyesterStapleFiberSpecs
