/-\!
# TreatyJPUSImmovable — 日米租税条約 第六条（不動産所得）L3

Article 6(1): income derived by a resident of one Contracting State from
immovable property situated in the other State may be taxed in that other State.
Article 6(2): 船舶及び航空機は、不動産とはみなさない (ships/aircraft are NOT
deemed immovable property).

L3 auxiliary layer, NOT merged into L0. Facts caller-supplied; not modelled.
-/
namespace JapanTaxLaw.TreatyJPUSImmovable

inductive State where | jp | us deriving DecidableEq

-- 第六条1: 不動産が他方の締約国内にあるとき、当該他方国は課税できる
def sourceMayTax (propertyState residentState : State) : Bool := propertyState != residentState

theorem source_state_taxes (p r : State) (h : p != r) : sourceMayTax p r = true := by simp [sourceMayTax, h]
theorem residence_state_no_source_tax (s : State) : sourceMayTax s s = false := by simp [sourceMayTax]

-- 第六条2: 船舶・航空機は不動産ではない（みなしを否定）
def isImmovable (kind : Nat) (immovableKinds : List Nat) : Bool := immovableKinds.contains kind

theorem ship_not_immovable (ship : Nat) (kinds : List Nat) (h : ship ∉ kinds) :
    isImmovable ship kinds = false := by simp [isImmovable, h]

def immovableDeclared : Bool := true
theorem immovable_is_declaration : immovableDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSImmovable
