/-\!
# CalculationBasisNorms — 計算の基礎（…の計算の基礎となる）40 units, PROVED_SCOPE

40 clauses across tax laws containing 「…の計算の基礎となる」— each identifies a
value that serves as the base for computing a derived amount (e.g. 「延滞金の額の
計算の基礎となる地方税」, 「退職所得控除額の計算の基礎となる勤続年数」). Only the
calculation-basis structure is kernel-proven (a derived amount is a function of its
base; the same base and function yield the same derived amount; a derivation
function composes; a zero base under a scaling function yields zero); the concrete
bases, functions and derived amounts are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.CalculationBasisNorms

-- 金額/数値は Nat
abbrev Value := Nat
-- 計算関数は基準値から派生値を計算
abbrev Derivation := Nat -> Nat

-- 計算の基礎：派生関数を基準に適用
def derivedFrom (d : Derivation) (base : Value) : Value := d base
theorem derivation_deterministic (d : Derivation) (base : Value) : derivedFrom d base = d base := rfl
theorem same_base_same_result (d : Derivation) (base a b : Value) (ha : a = d base) (hb : b = d base) : a = b := by
  subst a; subst b; rfl

-- 計算関数の合成（二段階の派生）
def composeDerivation (d1 d2 : Derivation) : Derivation := fun x => d2 (d1 x)
theorem compose_applies_in_sequence (d1 d2 : Derivation) (base : Value) :
    composeDerivation d1 d2 base = d2 (d1 base) := rfl

-- 加算_base による延滞金計算（構造）：派生 = base * rate（rate は NOT MODELLED なので関数で表現）
def scaledBase (base rate : Nat) : Nat := base * rate
theorem zero_base_zero_derived (rate : Nat) : scaledBase 0 rate = 0 := by unfold scaledBase; simp

def calculationBasisDeclared : Bool := true
theorem calculation_basis_is_declaration : calculationBasisDeclared = true := rfl

end JapanTaxLaw.CalculationBasisNorms
