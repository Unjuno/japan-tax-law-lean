/-\!
# KanjiOrdinalsSpec — 独立形式仕様

pinned 原文（漢数字の号番号・委任見出し・とする 45,621条片）から独立に読み取った
仕様。実装を import しない。

号番号は漢数字を序数 Nat に写像する（一=1 … 九十九=99）。委任見出しと とする は
構造宣言/接続詞であり、対応する条項の実内容は NOT MODELLED。
-/
namespace JapanTaxLaw.KanjiOrdinalsSpec

def ordinalSpec (s : String) : Option Nat :=
  match s.toList with
  | ['十'] => some 10
  | [a] => match a with
      | '一' => some 1 | '二' => some 2 | '三' => some 3 | '四' => some 4
      | '五' => some 5 | '六' => some 6 | '七' => some 7 | '八' => some 8
      | '九' => some 9 | _ => none
  | ['十', b] => (fun n => 10 + n) <$> (match b with
      | '一' => some 1 | '二' => some 2 | '三' => some 3 | '四' => some 4
      | '五' => some 5 | '六' => some 6 | '七' => some 7 | '八' => some 8
      | '九' => some 9 | _ => none)
  | [a, '十'] => (fun n => n * 10) <$> (match a with
      | '一' => some 1 | '二' => some 2 | '三' => some 3 | '四' => some 4
      | '五' => some 5 | '六' => some 6 | '七' => some 7 | '八' => some 8
      | '九' => some 9 | _ => none)
  | [a, '十', b] =>
      (fun x y => x * 10 + y) <$>
        (match a with
          | '一' => some 1 | '二' => some 2 | '三' => some 3 | '四' => some 4
          | '五' => some 5 | '六' => some 6 | '七' => some 7 | '八' => some 8
          | '九' => some 9 | _ => none) <*>
        (match b with
          | '一' => some 1 | '二' => some 2 | '三' => some 3 | '四' => some 4
          | '五' => some 5 | '六' => some 6 | '七' => some 7 | '八' => some 8
          | '九' => some 9 | _ => none)
  | _ => none

def delegationHeadingDeclaredSpec : Prop := True
def connectorSpec (x : Nat) : Nat := x

end JapanTaxLaw.KanjiOrdinalsSpec
