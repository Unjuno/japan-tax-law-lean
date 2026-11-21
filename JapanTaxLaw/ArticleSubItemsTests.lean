import JapanTaxLaw.ArticleSubItems
import JapanTaxLaw.ArticleSubItemsSpec
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-!
# ArticleSubItemsTests — 条の枝番号の代表variant検証
-/
namespace JapanTaxLaw.ArticleSubItemsTests

open JapanTaxLaw.ArticleSubItems

example : parseSubLabel "第七十一条の三十七" = some (71, 37) := by decide
example : parseSubLabel "第七十一条の三十三" = some (71, 33) := by decide
example : parseSubLabel "第七十一条の三十九" = some (71, 39) := by decide
example : parseSubLabel "第七十一条の三十二" = some (71, 32) := by decide
example : parseSubLabel "第七十一条の三十五" = some (71, 35) := by decide
example : parseSubLabel "第七十一条の三十八" = some (71, 38) := by decide
example : parseSubLabel "第七十一条の三十六" = some (71, 36) := by decide
example : parseSubLabel "第七十一条の三十四" = some (71, 34) := by decide
example : parseSubLabel "第三条の三" = some (3, 3) := by decide
example : parseSubLabel "第三条の二" = some (3, 2) := by decide
example : parseSubLabel "第二十二条の三十" = some (22, 30) := by decide
example : parseSubLabel "第二十二条の三十一" = some (22, 31) := by decide
example : parseSubLabel "第二十二条の二十七" = some (22, 27) := by decide
example : parseSubLabel "第二十二条の二十三" = some (22, 23) := by decide
example : parseSubLabel "第二十二条の二十九" = some (22, 29) := by decide
example : parseSubLabel "第二十二条の二十二" = some (22, 22) := by decide
example : parseSubLabel "第二十二条の二十五" = some (22, 25) := by decide
example : parseSubLabel "第二十二条の二十八" = some (22, 28) := by decide
example : parseSubLabel "第二十二条の二十六" = some (22, 26) := by decide
example : parseSubLabel "第二十二条の二十四" = some (22, 24) := by decide
example : parseSubLabel "第四条の二十" = some (4, 20) := by decide
example : parseSubLabel "第四条の二十一" = some (4, 21) := by decide
example : parseSubLabel "第一条の二" = some (1, 2) := by decide
example : parseSubLabel "第百四条の二" = some (104, 2) := by decide

example : subLabelDeclared = true := rfl

end JapanTaxLaw.ArticleSubItemsTests
