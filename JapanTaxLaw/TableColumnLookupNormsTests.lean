import JapanTaxLaw.TableColumnLookupNorms
import JapanTaxLaw.TableColumnLookupNormsSpec

/-!
# TableColumnLookupNormsTests — 表列参照
-/
namespace JapanTaxLaw.TableColumnLookupNormsTests
open JapanTaxLaw.TableColumnLookupNorms

theorem lookup_spec (rows : Nat → Option Nat) (k : Nat) : tableLookup rows k = JapanTaxLaw.TableColumnLookupNormsSpec.tableLookupSpec rows k := by rfl
example (rows : Nat → Option Nat) (k v : Nat) (h : rows k = some v) : tableLookup rows k = some v := lookup_found rows k v h
example (rows : Nat → Option Nat) (k : Nat) (h : rows k = none) : tableLookup rows k = none := lookup_missing rows k h
example (rows : Nat → Option Nat) (k v1 v2 : Nat) (h1 : tableLookup rows k = some v1) (h2 : tableLookup rows k = some v2) : v1 = v2 := lookup_deterministic rows k v1 v2 h1 h2
example : tableColumnLookupDeclared = true := table_column_lookup_is_declaration

end JapanTaxLaw.TableColumnLookupNormsTests
