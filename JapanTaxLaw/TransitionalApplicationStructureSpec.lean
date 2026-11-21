/-\!
# TransitionalApplicationStructureSpec — 独立形式仕様

pinned 原文（経過適用・読替適用 5952条片）から独立に読み取った仕様。実装を import しない。

読替は字句置換。新法は施行日以后、旧法は施行日前（排他的）。施行日前までの期間は
[start, enforcement)。「別段の定めがあるものを除き」は例外がなければ旧法適用。
具体的な条文・日付・納税者は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.TransitionalApplicationStructureSpec

def substituteSpec (x a b : Nat) : Nat := if x == a then b else x
def newLawSpec (d e : Nat) : Prop := e <= d
def oldLawSpec (d e : Nat) : Prop := d < e
def interimSpec (d s e : Nat) : Prop := s <= d ∧ d < e
def exceptSpec (ex old : Bool) : Bool := !ex && old

end JapanTaxLaw.TransitionalApplicationStructureSpec
