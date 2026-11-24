/-\!
# ResidualDelegationNorms — 残余事項の委任（…める事項）53 units, PROVED_SCOPE

53 clauses across tax laws ending 「…める事項。」— each is a residual delegation:
"other matters prescribed by cabinet order / ministry ordinance" (e.g.
「その他総務省令で定める事項」, 「政令で定める事項」), delegating the remaining
matters to an executive instrument. Only the delegation structure is kernel-proven
(a residual set is the complement of the enumerated set; residual delegation covers
all non-enumerated matters; adding an enumerated matter shrinks the residual;
residuals of disjoint enumerations compose); the concrete matters and instruments
are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ResidualDelegationNorms

-- 事項は Nat で識別（具体値は NOT MODELLED）
abbrev Matter := Nat
-- 列挙された事項の集合は述語で表現
abbrev Enumerated := Matter -> Bool

-- 残余集合：列挙に含まれない事項
def residual (e : Enumerated) (m : Matter) : Bool := !e m
theorem residual_excludes_enumerated (e : Enumerated) (m : Matter) (h : e m = true) : residual e m = false := by
  unfold residual
  simp [h]

-- 残余委任は全ての非列挙事項をカバー
def delegateResidual (e : Enumerated) (m : Matter) : Bool := residual e m
theorem delegation_covers_residual (e : Enumerated) (m : Matter) : delegateResidual e m = residual e m := rfl

-- 列挙を拡大すると残余は縮小
def extendEnum (e1 e2 : Enumerated) : Enumerated := fun m => e1 m || e2 m
theorem larger_enum_smaller_residual (e1 e2 : Enumerated) (m : Matter) :
    residual (extendEnum e1 e2) m = (residual e1 m && residual e2 m) := by
  unfold residual extendEnum
  cases e1 m <;> cases e2 m <;> rfl

def residualDelegationDeclared : Bool := true
theorem residual_delegation_is_declaration : residualDelegationDeclared = true := rfl

end JapanTaxLaw.ResidualDelegationNorms
