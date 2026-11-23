/-\!
# TableColumnLookupNormsSpec — 独立形式仕様

pinned 原文（表列参照「上欄/下欄」）から独立。実装を import しない。
-/
namespace JapanTaxLaw.TableColumnLookupNormsSpec

def tableLookupSpec (rows : Nat → Option Nat) (key : Nat) : Option Nat := rows key

end JapanTaxLaw.TableColumnLookupNormsSpec
