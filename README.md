# CHILD EVENT DOESN'T WORKS!!!!!
too lazy
***
- tutorial coming (not so) soon
- also only Korean

***

# 이벤트
{"note":"---","values":{},"child":{}} <<<< 기본 이벤트 형식
- note: 이벤트의 종류 입니다. (note가 "bullet" 이면 "se_bullet" 이라는 이름의 오브젝트 소환)
- values: 이벤트 오브젝트에 넣을 struct 입니다. (instance_create_depth(0, 0, 0, se_flash, <<여기 들어가는 항목>>)
- child: 이 이벤트 발동 시, 해당 struct 안에 있는 이벤트도 같이 실행 합니다. (이벤트안에이벤트안에이벤트안에이벤트 가능)

## 공용 이벤트
거의 모든 게임에서 사용할 예정이며, SEE 내에서도 대다수 작동 합니다.
### se_flash
- {"note":"flash","values":{"time":0.10,"alpha":0.30,"color":"#ffffff"}}
- time: 이벤트 시작부터 종료까지 걸리는 시간 입니다. (단위: 초)
- alpha: 섬광 효과의 시작 볼투명도 입니다. (0~1)
- color: 섬광 효과의 색상 입니다. (헥스 코드로 작성)
### se_camera_beat
- {"note":"camera_beat","values":{"time":0.4,"start_zoom":1.1,"end_zoom":1,"start_angle":5,"end_angle":0}}
- time: 이벤트 시작부터 종료까지 걸리는 시간 입니다. (단위: 초)

## Untitled Mining Game 이벤트
### se_bullet

### se_bullet_circle
