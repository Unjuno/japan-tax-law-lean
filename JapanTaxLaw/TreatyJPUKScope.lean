/-\!
# TreatyJPUKScope — 日英租税条約 第一条（適用範囲）・課税上存在しない団体

L3 条約層（別層、日英）。原文 pinned: data/raw/treaties/JP_UK_2006.txt
- 第一条：この条約は、一方又は双方の締約国の居住者である者に適用する
  （居住国の論理和）。
- 第三条１（BEPS MLI、条約第四条５に代わる）：課税上存在しない団体を通じて
  取得される所得は、居住者の所得として取り扱われる限りにおいて居住者の所得。

法的効力・具体的事実は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUKScope

-- 第一条：適用範囲は一方又は双方の居住者（論理和）
def inScope (residentJP residentUK : Bool) : Bool := residentJP || residentUK
theorem jp_resident_in_scope : inScope true false = true := by decide
theorem uk_resident_in_scope : inScope false true = true := by decide
theorem both_residents_in_scope : inScope true true = true := by decide
theorem neither_not_in_scope : inScope false false = false := by decide

-- 第三条１（BEPS）：透明団体を通じた所得は居住者の所得として扱う（対応する場合のみ）
def fiscallyTransparentAttribution (fiscallyTransparent treatedAsResidentIncome : Bool) : Bool :=
  fiscallyTransparent && treatedAsResidentIncome
theorem transparent_attributed : fiscallyTransparentAttribution true true = true := by decide
theorem nontransparent_not_attributed : fiscallyTransparentAttribution false true = false := by decide

def ukScopeDeclared : Bool := true
theorem uk_scope_is_declaration : ukScopeDeclared = true := rfl

end JapanTaxLaw.TreatyJPUKScope
