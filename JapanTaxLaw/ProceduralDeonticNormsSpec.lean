/-\!
# ProceduralDeonticNormsSpec — 独立形式仕様

pinned 原文（手続的義務規範 2483条片）から独立に読み取った仕様。実装を import しない。

承認を条件とする行為は approved のときのみ可行。作為義務/命令は呼出側が与える
真偽値。強制と任意は区別。具体的な行為者・金額は NOT MODELLED。
-/
namespace JapanTaxLaw.ProceduralDeonticNormsSpec

def approvalSpec (a : Bool) : Bool := a
def mandatorySpec (d : Bool) : Bool := d
def orderSpec (i : Bool) : Bool := i

end JapanTaxLaw.ProceduralDeonticNormsSpec
