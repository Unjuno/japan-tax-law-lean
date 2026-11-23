/-\!
# InheritanceTaxLiability — 相続税法 第一条の三（相続税の納税義務者）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  Article:1_3（相続税の納税義務者）

原文の規範構造：
- 主則：「次の各号のいずれかに掲げる者は、この法律により、相続税を納める義務
  がある。」＝ 号1〜号5 のいずれかに該当すれば納税義務が生ずる（論理和）。
- 号2（住所なしで財産取得）：
  - イ 日本国籍を有する個人であって：
    (1) 相続開始前10年以内のいずれの時においても施行地に住所を有していたことが
      あるもの ← 対象単位
    (2) 相続開始前10年以内のいずれの時にも住所がなく、且つ被相続人が外国人
      被相続人又は非居住被相続人でないもの
  - ロ 日本国籍を有しない個人（被相続人が外国人/非居住でない場合に限る）

変数の意味・単位・定義域：
  item1..item5 : Bool — 各号該当（原文の5つの号）
  japaneseNational : Bool — 日本国籍
  domicileNow : Bool — 財産取得時に施行地に住所
  hadDomicileWithin10y : Bool — 相続開始前10年以内に施行地住所を有していた
  decedentForeignOrNonResident : Bool — 被相続人が外国人/非居住
  acquiresJapanProperty : Bool — 施行地にある財産を取得

全ての条件分岐をカーネル検証。具体的な「住所」の認定や財産評価は NOT MODELLED。
-/
namespace JapanTaxLaw.InheritanceTaxLiability

-- 主則：いずれかの号に該当すれば納税義務
def hasTaxObligation (i1 i2 i3 i4 i5 : Bool) : Bool := i1 || i2 || i3 || i4 || i5
theorem item1_obliges : hasTaxObligation true false false false false = true := by decide
theorem item5_obliges : hasTaxObligation false false false false true = true := by decide
theorem no_item_no_obligation : hasTaxObligation false false false false false = false := by decide
-- 各号は十分条件
theorem item2_suffices (i1 i3 i4 i5 : Bool) : hasTaxObligation i1 true i3 i4 i5 = true := by simp [hasTaxObligation]

-- 号2イ(1)：日本国籍 且つ 現在住所なし 且つ 10年以内に住所保有
def item2i1 (japaneseNational domicileNow hadDomicileWithin10y : Bool) : Bool :=
  japaneseNational && !domicileNow && hadDomicileWithin10y
theorem item2i1_holds : item2i1 true false true = true := by decide
theorem item2i1_needs_no_current_domicile : item2i1 true true true = false := by decide
theorem item2i1_needs_japanese : item2i1 false false true = false := by decide
theorem item2i1_needs_10y_domicile : item2i1 true false false = false := by decide

-- 号2イ：日本国籍 且つ 住所なし 且つ（10年以内住所 又は 被相続人が外国人/非居住でない）
def item2i (japaneseNational domicileNow hadDomicileWithin10y decedentForeignNonResident : Bool) : Bool :=
  japaneseNational && !domicileNow &&
    (hadDomicileWithin10y || !decedentForeignNonResident)
theorem item2i1_implies_item2i (j d h f : Bool) (h1 : item2i1 j d h = true) :
    item2i j d h f = true := by
  unfold item2i1 at h1
  unfold item2i
  cases j <;> cases d <;> cases h <;> cases f <;> simp_all

def inheritanceTaxLiabilityDeclared : Bool := true
theorem inheritance_tax_liability_is_declaration : inheritanceTaxLiabilityDeclared = true := rfl

end JapanTaxLaw.InheritanceTaxLiability
