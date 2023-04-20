import pygame
import sys, time, random


####
# INITIAL VALUES
# Box Size
size = height, width = 400, 400

#Colour of th bg
black = 0, 0, 0 

#Object stats
speed = [1, 1]
    

class moving_object:
    def __init__(self, object_scale=[75,75], speed=[1,1], image_src="graphics/olkku.png"):
        self.object_scale = object_scale
        self.speed = speed
        self.image_src = image_src

    def create_game_object(self):
        game_object = pygame.image.load(self.image_src)
        game_object = pygame.transform.scale(game_object, self.object_scale)
        
        return game_object
    
    def get_object_rectangle(self):
        return self.create_game_object().get_rect()
    
    def move_object(self):
        return self.get_object_rectangle().move(self.speed)

    

def start():
    pygame.init()

    olkku_object = moving_object()
    olkku = olkku_object.create_game_object()

    #Colour of th bg
    black = 0, 0, 0 

    screen = pygame.display.set_mode(size)

    img_rect = olkku.get_rect()
    img_rect.center = height // 2, width // 2
    # # img_rect.center = (height / 9, width / 5)
    print(img_rect)

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT: sys.exit()

        img_rect = img_rect.move(speed)
        
        if img_rect.left < 10 or img_rect.right > width-10:
            speed[0] = -int(random.random() * 10)
            
        if img_rect.top < 10 or img_rect.bottom > height-10:
            speed[1] = -int(random.random() * 10)
            


        screen.fill(black)
        screen.blit(olkku, img_rect)
        pygame.draw.rect(screen, (100, 0, 0), img_rect, 1)
        pygame.display.flip()
        # print(img_rect)
        time.sleep(0.1)

if __name__ == '__main__':
    start()