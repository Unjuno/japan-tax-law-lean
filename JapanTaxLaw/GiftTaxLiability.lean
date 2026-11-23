/-\!
# GiftTaxLiability — 相続税法 第一条の四（贈与税の納税義務者）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000073_20260401_506AC0000000008.law.json Article:1_4

原文の規範構造（第一条の三（相続税）と同型）：
- 主則：「次の各号のいずれかに掲げる者は…贈与税を納める義務がある」
  ＝ 号1〜4 のいずれかに該当すれば納税義務（論理和）。
- 号2イ(1)：日本国籍の個人で、財産取得時に施行地に住所がなく、且つ贈与前
  10年以内に施行地に住所を有していたことがある者 ← 対象単位。
- 号2イ(2)：日本国籍で、10年以内に住所がなく、且つ贈与者が外国人/非居住でない。
- 号2ロ：日本国籍なし（贈与者が外国人/非居住でない場合に限る）。

変数の意味・定義域：
  item1..item4 : Bool — 各号該当; japaneseNational : 日本国籍
  domicileNow : 財産取得時の施行地住所; hadDomicileWithin10y : 贈与前10年以内の住所
  donorForeignNonResident : 贈与者が外国人/非居住

「住所」の具体的認定は NOT MODELLED。
-/
namespace JapanTaxLaw.GiftTaxLiability

-- 主則：いずれかの号に該当すれば納税義務
def hasGiftTaxObligation (i1 i2 i3 i4 : Bool) : Bool := i1 || i2 || i3 || i4
theorem item1_obliges : hasGiftTaxObligation true false false false = true := by decide
theorem item4_obliges : hasGiftTaxObligation false false false true = true := by decide
theorem no_item_no_obligation : hasGiftTaxObligation false false false false = false := by decide

-- 号2イ(1)：日本国籍 且つ 現在住所なし 且つ 10年以内に住所保有
def item2i1 (japaneseNational domicileNow hadDomicileWithin10y : Bool) : Bool :=
  japaneseNational && !domicileNow && hadDomicileWithin10y
theorem item2i1_holds : item2i1 true false true = true := by decide
theorem item2i1_needs_no_current_domicile : item2i1 true true true = false := by decide
theorem item2i1_needs_japanese : item2i1 false false true = false := by decide
theorem item2i1_needs_10y_domicile : item2i1 true false false = false := by decide

-- 号2イ：日本国籍 且つ 住所なし 且つ（10年以内住所 又は 贈与者が外国人/非居住でない）
def item2i (japaneseNational domicileNow hadDomicileWithin10y donorForeignNonResident : Bool) : Bool :=
  japaneseNational && !domicileNow && (hadDomicileWithin10y || !donorForeignNonResident)
theorem item2i1_implies_item2i (j d h f : Bool) (h1 : item2i1 j d h = true) :
    item2i j d h f = true := by
  unfold item2i1 at h1
  unfold item2i
  cases j <;> cases d <;> cases h <;> cases f <;> simp_all

def giftTaxLiabilityDeclared : Bool := true
theorem gift_tax_liability_is_declaration : giftTaxLiabilityDeclared = true := rfl

end JapanTaxLaw.GiftTaxLiability
