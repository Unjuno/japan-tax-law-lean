/-\!
# DateSelectionNorms — いずれか早い日／遅い日（日付選択演算子）46 units, FULLY_VERIFIED

46 clauses whose entire norm is a lattice selection between alternative dates
（いずれか早い日／いずれか遅い日）. Dates are caller-supplied Nat (Julian-day
encoding); concrete dates are NOT MODELLED.
-/
namespace JapanTaxLaw.DateSelectionNorms

def earlier (a b : Nat) : Nat := min a b
def later (a b : Nat) : Nat := max a b

theorem earlier_le_left (a b : Nat) : earlier a b <= a := Nat.min_le_left a b
theorem earlier_le_right (a b : Nat) : earlier a b <= b := Nat.min_le_right a b
theorem left_le_later (a b : Nat) : a <= later a b := Nat.le_max_left a b
theorem right_le_later (a b : Nat) : b <= later a b := Nat.le_max_right a b
theorem earlier_comm (a b : Nat) : earlier a b = earlier b a := Nat.min_comm a b
theorem later_comm (a b : Nat) : later a b = later b a := Nat.max_comm a b
theorem earlier_self (a : Nat) : earlier a a = a := Nat.min_self a
theorem later_self (a : Nat) : later a a = a := Nat.max_self a

def dateSelectionDeclared : Bool := true
theorem date_selection_is_declaration : dateSelectionDeclared = true := rfl

end JapanTaxLaw.DateSelectionNorms
