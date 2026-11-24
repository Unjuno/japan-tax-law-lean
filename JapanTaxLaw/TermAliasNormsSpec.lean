/-\!
# TermAliasNormsSpec — 独立形式仕様

原文（用語の定義）から独立。実装を import しない。
-/
namespace JapanTaxLaw.TermAliasNormsSpec

def aliasOfSpec (a b : Nat) : Bool := a == b
def aliasIntroSpec (defn : Nat) : Nat := defn

end JapanTaxLaw.TermAliasNormsSpec
