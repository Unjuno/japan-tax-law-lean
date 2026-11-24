/-\!
# ImpositionCollectionEffectsSpec — 独立形式仕様

原文（課する/科する/収する 効果演算子）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ImpositionCollectionEffectsSpec

def imposeTaxSpec (base rate : Nat) : Nat := base + rate
def imposePenaltySpec (violation : Bool) : Bool := violation
def combineObligationsSpec (a b : Nat) : Nat := a + b
def collectionPrioritySpec (p : Nat) : Nat := p
def collectSpec (obligation amount : Nat) : Nat := obligation - amount

end JapanTaxLaw.ImpositionCollectionEffectsSpec
