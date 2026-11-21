/-\!
# DeonticModalityNormsSpec — 独立形式仕様

pinned 原文（義務・許可・禁止・記録 5279条片）から独立に読み取った仕様。実装を import しない。

義務/禁止は呼出側が与える真偽値、許可は allowed/forbidden、モダリティは義務・許可・禁止
の区別。具体的な行為は NOT MODELLED。
-/
namespace JapanTaxLaw.DeonticModalityNormsSpec

def obligationSpec (d : Bool) : Bool := d
def prohibitionSpec (d : Bool) : Bool := d
def allowedSpec (a : Bool) : Bool := a

end JapanTaxLaw.DeonticModalityNormsSpec
