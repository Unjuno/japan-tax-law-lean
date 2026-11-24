/-\!
# SimilarlyApplyNormsSpec — 独立形式仕様

原文（同様とする）から独立。実装を import しない。
-/
namespace JapanTaxLaw.SimilarlyApplyNormsSpec

def similarlyApplySpec (base extra : Bool) : Bool := base || extra
def extendTwiceSpec (a b c : Bool) : Bool := (a || b) || c

end JapanTaxLaw.SimilarlyApplyNormsSpec
