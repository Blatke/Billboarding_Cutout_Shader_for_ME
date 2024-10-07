# Billboarding Cutout Shader for ME
This is to let MaterialEditor show the Billboarding Cutout Shader's options on the tab.

## What Is It
With using this shader on an object, it will show **silhouette** of the Vector -Y (or the reverse normal direction) of the object and it always **faces to the camera or your view**.

Look at the figure below. There is a box of bread:

![AI_2024-10-07-13-24-26-102](https://github.com/user-attachments/assets/d0b3e715-ae55-4c4e-84fa-875995a920de)

Change the shaders of the materials of both the bread and box to **Particles/Billboarding Cutout**, then you can see this image:

![AI_2024-10-07-13-25-17-155](https://github.com/user-attachments/assets/27642c29-40f4-4e1b-9221-77200ac09f88)

It shows a silhouette of the bottom sides of the box and bread, because these sides are on the Vector -Y of theirs.

Please note that it doesn't merely make a silhouette but also let it always face to your view or camera wherever you rotate the view. Just like the Workspace or other menu on your screen, they won't move when rotating your view. 

For this Jupiter planet below:

![AI_2024-10-07-13-29-06-040](https://github.com/user-attachments/assets/919f43fa-85a3-4f71-974b-231fea2e4875)

It doesn't show the silhouette of its bottom side that could be its south pole. Instead, it shows a part of the equator, because for the mesh its Vector -Y is on this part, so it makes such silhouette.

![AI_2024-10-07-13-29-29-790](https://github.com/user-attachments/assets/b6b83d4c-367c-4325-8a06-9e668f9729c5)

It will be useful when you add some comic speed lines (for instance, https://github.com/Blatke/Comic-Effects) in the scene, and you don't need to manipulate them every time you change the view angle.

## Shaders Included
### 1. Particles/Billboarding Cutout

It culls the alpha parts of a texture you import as MainTex.

The properties it has on the MaterialEditor tab are listed below:
**MainTex** - The main texture it shows with culling the alpha parts. You can also adjust its scale and offset values to change its tiling and position of the texture.

**Cutoff** - To what extent it cull the alpha parts. If the main texture has gradient color from black and gray to white, as the cutoff value increasing, it culls at first the black, then dark gray, and finally light gray parts. It could be pretty useful in making animation.

**TintColor** - The color that will blend with the texture.
**ScaleX** - The width of the silhouette. It's different from that scale in MainTex, for this one is to change the region of showing the texture.

**Scale Y** - The height of the silhouette.

**Rotation** - The degree taht the silhouette rotates.

### 2. Particles/Billboarding Cutout Top

This one has the same basic function and properties as the earlier one. The only difference is that it's always on the top of everything in the scene regardless of the distances the rest of things are keeping from your view or camera.

For instance, there is an item of speed lines shadered by **Particles/Billboarding Cutout**. You can see in the picuture some of the lines are covered by the characters and wall, because the latters are nearer than the lines are to your view.

![AI_2024-10-07-13-19-04-474](https://github.com/user-attachments/assets/f7fd6a37-6d02-4693-b055-96f3332eda87)

After changing to **Particles/Billboarding Cutout Top**, the lines go to the front without wasting time in moving them. 

![AI_2024-10-07-13-19-48-302](https://github.com/user-attachments/assets/0c85d3eb-f565-4a26-a153-a3ef49baacd3)

## How to Install
Download the .zipmod file for the latest version on the [Release](https://github.com/Blatke/Billboarding_Cutout_Shader_for_ME/releases) page, then drag and drop it into your **/mods/** folder, or use KKManager to install it.

So, it will appear on your MaterialEditor tab with the shader name: **Particles/Billboarding Cutout** (as well as the rest of the shaders in this mod pack).
