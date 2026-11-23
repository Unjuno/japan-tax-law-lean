/-\!
# TableColumnLookupNorms — 表列参照（「上欄に掲げる…下欄に定める…」）107 units, PROVED_SCOPE

107 clauses containing a table-column reference: a value is obtained by looking
up a row in a table by its upper-column key and reading the lower-column value
(上欄に掲げる区分に応ずる下欄に定める金額). Only the lookup structure is
kernel-proven; the concrete table contents are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.TableColumnLookupNorms

-- 表参照：key で row を引き、下欄値を返す（total function モデル）
-- rows: キー→値 の写像を関数として与える（呼出側が具体的表を提供）
def tableLookup (rows : Nat → Option Nat) (key : Nat) : Option Nat := rows key

theorem lookup_found (rows : Nat → Option Nat) (k v : Nat) (h : rows k = some v) :
    tableLookup rows k = some v := by simp [tableLookup, h]
theorem lookup_missing (rows : Nat → Option Nat) (k : Nat) (h : rows k = none) :
    tableLookup rows k = none := by simp [tableLookup, h]

-- 同じキーは同じ結果（函数性）
theorem lookup_deterministic (rows : Nat → Option Nat) (k : Nat) (v1 v2 : Nat)
    (h1 : tableLookup rows k = some v1) (h2 : tableLookup rows k = some v2) : v1 = v2 := by
  exact Option.some.inj (h1.symm.trans h2)

def tableColumnLookupDeclared : Bool := true
theorem table_column_lookup_is_declaration : tableColumnLookupDeclared = true := rfl

end JapanTaxLaw.TableColumnLookupNorms
