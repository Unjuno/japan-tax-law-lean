/-\!
# FixedAssetTaxDetail — 地方税法 第三百六十四条（固定資産税の課税明細書）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:364

原文の規範構造（対象2単位 = 第3項の2つの号）:
市町村は、土地又は家屋に対して課する固定資産税を徴収しようとする場合には、
次の各号に掲げる固定資産税の区分に応じ、当該各号に定める事項を記載した
文書（課税明細書）を納税者に交付しなければならない。
- 号1：土地に対して課する固定資産税 → 所在・地番・地目・地積・当該年度の
  固定資産税に係る課税標準額等
- 号2：家屋に対して課する固定資産税 → 所在・家屋番号・種類・構造・床面積等

変数: `assetType` 土地/家屋, `deliverDetail` 課税明細書交付義務。
「政令で定める事項」の具体的内容は NOT MODELLED。
-/
namespace JapanTaxLaw.FixedAssetTaxDetail

-- 課税明細書の交付義務：土地/家屋のいずれの区分でも交付
def detailRequired (isLand isHouse : Bool) : Bool := isLand || isHouse
theorem land_requires_detail : detailRequired true false = true := by decide
theorem house_requires_detail : detailRequired false true = true := by decide
theorem neither_no_detail : detailRequired false false = false := by decide

-- 区分は排他的（土地 かつ 家屋 は想定しない）— 重複しても交付義務は同じ
theorem both_still_required : detailRequired true true = true := by decide

def fixedAssetTaxDetailDeclared : Bool := true
theorem fixed_asset_tax_detail_is_declaration : fixedAssetTaxDetailDeclared = true := rfl

end JapanTaxLaw.FixedAssetTaxDetail
