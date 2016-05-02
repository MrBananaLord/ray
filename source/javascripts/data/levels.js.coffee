RaY.Data.Levels = [
  {
    name: "Tutorial 1"
    background: {
      fillStyle: "#80f"
      width: 640
      height: 480
    }
    yellowHero: {
      x: 50
      y: 454
    }
    redHero: {
      x: 560
      y: 454
      firstAnimation: "stayLeft"
    }
    goal: {
      x: 300
      y: 445
    }
    elements: [
      {
        klass: RaY.Models.Platform
        elements: [
          # sides
          [0, 0, 5, 480, "#fff"]
          [0, 0, 640, 5, "#fff"]
          [635, 0, 5, 480, "#fff"]
          [0, 475, 640, 5, "#fff"]
        ]
      }
      {
        klass: RaY.Models.Message
        elements: [
          [
            'Oh no! Someone stole your rainbow colors!',
            {
              x: 175
              y: 125
              width: 340
              height: 32
              contentX: 10
              contentY: 22
            }
          ],
          [
            'Get to the food bowl to regain colors of rainbow.',
            {
              x: 175
              y: 155
              width: 340
              height: 32
              contentX: 10
              contentY: 22
            }
          ],
          [
            'a',
            {
              x: 50
              y: 350
              width: 20
              height: 20
              contentX: 7
              contentY: 15
            }
          ],
          [
            's',
            {
              x: 75
              y: 350
              width: 20
              height: 20
              contentX: 7
              contentY: 15
            }
          ],
          [
            'd',
            {
              x: 100
              y: 350
              width: 20
              height: 20
              contentX: 6
              contentY: 15
            }
          ],
          [
            'w',
            {
              x: 75
              y: 325
              width: 20
              height: 20
              contentX: 4
              contentY: 15
            }
          ],
          [
            '←',
            {
              x: 500
              y: 350
              width: 20
              height: 20
              contentX: 2
              contentY: 15
            }
          ],
          [
            '↓',
            {
              x: 525
              y: 350
              width: 20
              height: 20
              contentX: 6
              contentY: 15
            }
          ],
          [
            '→',
            {
              x: 550
              y: 350
              width: 20
              height: 20
              contentX: 3
              contentY: 15
            }
          ],
          [
            '↑',
            {
              x: 525
              y: 325
              width: 20
              height: 20
              contentX: 6
              contentY: 15
            }
          ]
        ]
      }
    ]
  }
  {
    name: "Tutorial 2"
    background: {
      fillStyle: "#00f"
      width: 640
      height: 480
    }
    yellowHero: {
      x: 50
      y: 395
    }
    redHero: {
      x: 460
      y: 395
      firstAnimation: "stayLeft"
    }
    goal: {
      x: 560
      y: 385
    }
    elements: [
      {
        klass: RaY.Models.Platform
        elements: [
          # sides
          [0, 0, 5, 480, "#fff"]
          [0, 0, 640, 5, "#fff"]
          [635, 0, 5, 480, "#fff"]
          [0, 475, 640, 5, "#fff"]
          # platforms
          [0, 415, 240, 5, "#fff"]
          [400, 415, 240, 5, "#fff"]
          [400, 415, 5, 70, "#fff"]
          [240, 415, 5, 70, "#fff"]
        ]
      }
      {
        klass: RaY.Models.Box
        elements: [
          [400, 395, "#e92"]
        ]
      }
    ]
  }
  {
    name: "First challenge"
    background: {
      fillStyle: "#0f0"
      width: 640
      height: 480
    }
    yellowHero: {
      x: 50
      y: 395
    }
    redHero: {
      x: 480
      y: 375
      firstAnimation: "stayLeft"
    }
    goal: {
      x: 560
      y: 370
    }
    elements: [
      {
        klass: RaY.Models.Platform
        elements: [
          # sides
          [0, 0, 5, 480, "#fff"]
          [0, 0, 640, 5, "#fff"]
          [635, 0, 5, 480, "#fff"]
          [0, 475, 640, 5, "#fff"]
          # platforms
          [0, 415, 240, 5, "#fff"]
          [400, 400, 240, 5, "#fff"]
          [400, 400, 5, 80, "#fff"]
          [240, 415, 5, 70, "#fff"]

          [240, 380, 25, 5, "#fff"]
          [270, 360, 25, 5, "#fff"]
          [300, 340, 50, 5, "#fff"]
          [350, 0, 5, 320, "#fff"]
        ]
      }
      {
        klass: RaY.Models.Box
        elements: [
          [400, 375, "#e92"]
          [325, 300, "#e92"]
        ]
      }
    ]
  }
  {
    name: "Almost deadly"
    background: {
      fillStyle: "#f80"
      width: 640
      height: 480
    }
    yellowHero: {
      x: 20
      y: 180
    }
    redHero: {
      x: 480
      y: 375
      firstAnimation: "stayLeft"
    }
    goal: {
      x: 15
      y: 350
    }
    elements: [
      {
        klass: RaY.Models.Platform
        elements: [
          # sides
          [0, 0, 5, 480, "#fff"]
          [0, 0, 640, 5, "#fff"]
          [635, 0, 5, 480, "#fff"]
          [0, 475, 640, 5, "#fff"]
          # platforms
          [0, 260, 280, 5, "#fff"]
          [0, 200, 80, 5, "#fff"]
          [160, 200, 185, 5, "#fff"]

          [235, 140, 75, 5, "#fff"]
          [235, 140, 5, 30, "#fff"]
          [305, 140, 5, 30, "#fff"]

          [80, 140, 80, 5, "#fff"]
          [80, 140, 5, 30, "#fff"]
          [155, 140, 5, 30, "#fff"]

          # long drop
          [280, 260, 5, 80, "#fff"]
          [320, 260, 5, 80, "#fff"]
          [220, 370, 120, 5, "#fff"]

          [380, 260, 5, 190, "#fff"]
          [5, 380, 100, 5, "#fff"]
        ]
      }
      {
        klass: RaY.Models.Box
        elements: [
          [60, 175, "#e92"]
          [260, 115, "#e92"]
          [520, 435, "#e92"]
          [120, 405, "#e92"]
          [120, 385, "#e92"]
        ]
      }
    ]
  }
  {
    name: "Not that easy"
    background: {
      fillStyle: "#f00"
      width: 640
      height: 480
    }
    yellowHero: {
      x: 50
      y: 395
    }
    redHero: {
      x: 480
      y: 375
      firstAnimation: "stayLeft"
    }
    goal: {
      x: 560
      y: 370
    }
    elements: [
      {
        klass: RaY.Models.Platform
        elements: [
          # sides
          [0, 0, 5, 480, "#fff"]
          [0, 0, 640, 5, "#fff"]
          [635, 0, 5, 480, "#fff"]
          [0, 475, 640, 5, "#fff"]
          # platforms
          [0, 415, 240, 5, "#fff"]
          [400, 400, 240, 5, "#fff"]
          [400, 400, 5, 80, "#fff"]
          [240, 415, 5, 70, "#fff"]

          [240, 380, 25, 5, "#fff"]
          [270, 360, 25, 5, "#fff"]
          [300, 340, 50, 5, "#fff"]
          [350, 0, 5, 320, "#fff"]
        ]
      }
      {
        klass: RaY.Models.Box
        elements: [
          [400, 375, "#e92"]
          [325, 300, "#e92"]
        ]
      }
    ]
  }
  {
    name: "Xtreme"
    background: {
      fillStyle: "#234"
      width: 640
      height: 480
    }
    yellowHero: {
      x: 15
      y: 470
    }
    redHero: {
      x: 15
      y: 280
    }
    goal: {
      x: 600
      y: 350
    }
    elements: [
      {
        klass: RaY.Models.Platform
        elements: [
          # sides
          [0, 0, 5, 480, "#fff"]
          [0, 0, 640, 5, "#fff"]
          [635, 0, 5, 480, "#fff"]
          [0, 475, 640, 5, "#fff"]
          # platforms
          [50, 435, 75, 5, "#fff"]
          [125, 375, 200, 5, "#fff"]
          [5, 300, 95, 5, "#fff"]
          [190, 380, 5, 95, "#fff"]
          [105, 260, 70, 5, "#fff"]
          [100, 260, 5, 20, "#fff"]
          [170, 180, 5, 80, "#fff"]
          [70, 220, 20, 5, "#fff"]
          [35, 140, 75, 5, "#fff"]
          [5, 105, 25, 5, "#fff"]
          [45, 70, 75, 5, "#fff"]
          [175, 180, 60, 5, "#fff"]
          [320, 180, 5, 195, "#fff"]
          [290, 180, 75, 5, "#fff"]
          [250, 70, 5, 70, "#fff"]
          [290, 160, 5, 60, "#fff"]
          [365, 180, 5, 125, "#fff"]
          [405, 180, 5, 125, "#fff"]
          [325, 340, 125, 5, "#fff"]
          [410, 180, 225, 5, "#fff"]
          [145, 70, 225, 5, "#fff"]
          [420, 70, 215, 5, "#fff"]
          [580, 380, 55, 5, "#fff"]
          [295, 355, 25, 5, "#fff"]
          [235, 325, 25, 5, "#fff"]
          [175, 295, 25, 5, "#fff"]
          [235, 265, 25, 5, "#fff"]
          [175, 235, 25, 5, "#fff"]
          [235, 215, 55, 5, "#fff"]
        ]
      }
      {
        klass: RaY.Models.Box
        elements: [
          [70, 200, "#e92"]
          [70, 50, "#e92"]
          [70, 120, "#e92"]
          [170, 160, "#e92"]
          [550, 160, "#e92"]
          [280, 50, "#e92"]
          [470, 50, "#e92"]

          [510, 455, "#e92"]
          [530, 455, "#e92"]
          [510, 434, "#e92"]
          [530, 434, "#e92"]
        ]
      }
    ]
  }
  {
    name: "The End"
    gui: "hidden"
    background: {
      fillStyle: "#f34"
      width: 640
      height: 480
    }
    yellowHero: {
      x: 50
      y: 454
    }
    redHero: {
      x: 560
      y: 454
      firstAnimation: "stayLeft"
    }
    elements: [
      {
        klass: RaY.Models.Platform
        elements: [
          # sides
          [0, 0, 5, 480, "#fff"]
          [0, 0, 640, 5, "#fff"]
          [635, 0, 5, 480, "#fff"]
          [0, 475, 640, 5, "#fff"]
        ]
      }
    ]
  }
]
