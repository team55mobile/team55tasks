# team55tasks

Менеджер задач

Вроде как задуман для авторизации в файрбейс и хранения данных там же, что из этого получится посмотрим позднее

---------------------------------------------
## СБОРКА ПОД IOS

fastline для сборки и публикации

github actions для сборки из обдака

---------------------------------------------
## СБОРКА ПОД ANDROID

fastline для сборки и публикации

github actions для сборки из облака


---------------------------------------------
## СБОРКА ПОД ВЕБ 

У нас есть два варианта - собрать и опубликовать самим или оставить это на гитхаб экшены

### первый вариант (complete)

flutter build web

firebase deploy --only hosting:team55tasks

### второй вариант (complete)

мучаем гисты и пользуемся мастером файрбейса для хостинга для генерации тасок

https://gist.github.com/rodydavis/bde9a9a8c2fcdcf3474c0f50248f2e3a

https://gist.github.com/lukepighetti/dca8d731aa95adfa86fd01b0c76222d5

https://team55tasks.web.app/#/ адрес страницы. Остальное в файрбейс конслоли
