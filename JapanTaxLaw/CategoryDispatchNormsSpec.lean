/-\!
# CategoryDispatchNormsSpec — 独立形式仕様

pinned 原文（区分に応じ 1405条片）から独立に読み取った仕様。実装を import しない。

区分別選択は、表を先頭から走査し最初に一致した区分の値を返す。具体的な区分・値は NOT MODELLED。
-/
namespace JapanTaxLaw.CategoryDispatchNormsSpec

def dispatchSpec (key : Nat) (table : List (Nat × Nat)) : Option Nat :=
  table.find? (fun p => p.1 == key) |>.map (fun p => p.2)

end JapanTaxLaw.CategoryDispatchNormsSpec
