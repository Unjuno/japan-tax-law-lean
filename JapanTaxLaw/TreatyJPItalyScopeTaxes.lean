/-\!
# TreatyJPItalyScopeTaxes — 日伊租税条約 第一条（適用範囲）・第二条（対象租税）

L3 条約層（別層、日伊）。原文 pinned: data/raw/treaties/JP_ITALY_1969.txt
(縦書きテキストを連結して監査)。
- 第一条：一方又は双方の締約国の居住者である者に適用（論理和）。
- 第二条：対象租税（日本：所得税/法人税/住民税、伊：個人所得税/法人所得税/
  地方所得税）+ 後続の同一又は実質的に類似の租税にも適用（successor extension）。

法的効力・具体租税リストは NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPItalyScopeTaxes

-- 第一条：適用範囲
def inScope (residentJP residentIT : Bool) : Bool := residentJP || residentIT
theorem jp_resident_in_scope : inScope true false = true := by decide
theorem it_resident_in_scope : inScope false true = true := by decide
theorem neither_not_in_scope : inScope false false = false := by decide

-- 第二条：対象租税（listed 又は successor）
def coveredTax (listed successorSimilar : Bool) : Bool := listed || successorSimilar
theorem listed_tax_covered : coveredTax true false = true := by decide
theorem successor_tax_covered : coveredTax false true = true := by decide
theorem unrelated_tax_not_covered : coveredTax false false = false := by decide

def italyScopeTaxesDeclared : Bool := true
theorem italy_scope_taxes_is_declaration : italyScopeTaxesDeclared = true := rfl

end JapanTaxLaw.TreatyJPItalyScopeTaxes
