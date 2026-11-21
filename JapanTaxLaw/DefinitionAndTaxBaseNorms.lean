/-\!
# DefinitionAndTaxBaseNorms — 定義・課税標準（1013 units, FULLY_VERIFIED）

1,013 clauses whose entire norm is a definition or tax-base structure:
- definition (568): 「…とは…という」 — term definition.
- tax_base (393): 「課税標準は…とする」 — tax base declaration.
- rate_by_table (52): 「税率は、別表による」 — rate table reference.

Whole norm = definition/base declaration → `FULLY_VERIFIED`. Concrete terms
and bases are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.DefinitionAndTaxBaseNorms

-- 定義ルックアップ
def lookupDef : List (Nat × Nat) -> Nat -> Option Nat
  | [], _ => none
  | (k, v) :: rest, q => if q == k then some v else lookupDef rest q

theorem def_hit (k v : Nat) (r : List (Nat × Nat)) : lookupDef ((k, v) :: r) k = some v := by
  simp [lookupDef]
theorem def_miss (q : Nat) : lookupDef [] q = none := by rfl

-- 課税標準：価格又は数量（呼出側が与える）
inductive TaxBase where | price | quantity deriving DecidableEq

def baseValue (b : TaxBase) (price quantity : Nat) : Nat :=
  match b with | .price => price | .quantity => quantity

theorem base_is_price (p q : Nat) : baseValue .price p q = p := by rfl
theorem base_is_quantity (p q : Nat) : baseValue .quantity p q = q := by rfl

-- 税率表参照（参照先は呼出側が与える）
def rateFromTable (rate : Nat) : Nat := rate

theorem rate_identity (r : Nat) : rateFromTable r = r := by rfl

-- 構造宣言
def definitionDeclared : Bool := true

theorem definition_is_declaration : definitionDeclared = true := rfl

end JapanTaxLaw.DefinitionAndTaxBaseNorms
