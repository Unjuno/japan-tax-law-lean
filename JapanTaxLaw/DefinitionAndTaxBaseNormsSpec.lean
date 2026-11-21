/-\!
# DefinitionAndTaxBaseNormsSpec — 独立形式仕様

pinned 原文（定義・課税標準 1013条片）から独立に読み取った仕様。実装を import しない。

定義は表引き、課税標準は価格または数量、税率は表参照。具体的な用語・金額は NOT MODELLED。
-/
namespace JapanTaxLaw.DefinitionAndTaxBaseNormsSpec

def defSpec (k : Nat) : Option Nat := none
def basePrice (p q : Nat) : Nat := p
def baseQuantity (p q : Nat) : Nat := q
def rateSpec (r : Nat) : Nat := r

end JapanTaxLaw.DefinitionAndTaxBaseNormsSpec
