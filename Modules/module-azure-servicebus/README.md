����#   m o d u l e - a z u r e - s e r v i c e b u s  
  
 T e r r a f o r m   m o d u l e   t o   p r o v i s i o n   a n   [ A z u r e   S e r v i c e B u s ] ( < h t t p s : / / d o c s . m i c r o s o f t . c o m / e n - u s / a z u r e / s e r v i c e - b u s - m e s s a g i n g / > ) .  
  
 # #   U s a g e  
  
 ` ` ` H C L  
 m o d u l e   " s b "   {  
     s o u r c e                                   =   " . / . . / m o d u l e - a z u r e - s e r v i c e b u s "  
     n a m e                                       =   " u i s - i n f r a - d e v - e a s t u s - 1 "  
     r e s o u r c e _ g r o u p _ n a m e         =   " r g - u i s - i n f r a - d e v - e a s t u s - 1 "  
     l o c a t i o n                               =   " e a s t u s "  
     s u b n e t _ i d                             =   " / s u b s c r i p t i o n s / 8 c c 6 b 0 e 7 - e 3 4 1 - 4 1 0 3 - b e d 6 - 5 7 4 d 6 b 2 9 8 3 3 7 / r e s o u r c e G r o u p s / r g - u i s - i n f r a - d e v - e a s t u s - 0 0 1 / p r o v i d e r s / M i c r o s o f t . N e t w o r k / v i r t u a l N e t w o r k s / v n e t - u i s - i n f r a - d e v - e a s t u s - 0 0 1 / s u b n e t s / d e f a u l t "  
     s e r v i c e b u s _ t o p i c _ n a m e s   =   [ " t o p c 1 " ,   " t o p i c 2 " ]  
     s k u                                         =   " P r e m i u m "  
     s b _ i p _ w h i t e l i s t                 =   " 0 . 0 . 0 . 0 , 1 . 1 . 1 . 1 "  
  
     t a g s   =   {  
         " C o n f i d e n t i a l i t y "   :   " p r i v a t e "  
         " S L A "                           :   " 2 4 h o u r s "  
         " B u s i n e s s I m p a c t "     :   " M o d e r a t e "  
         " B u s i n e s s P r o c e s s "   :   " S u p p o r "  
         " R e v e n u e I m p a c t "       :   " H i g h "  
         " M a n a g e d B y "               :   " D e v O p s "  
     }  
 }  
  
 ` ` `  
  
  
 # #   I n p u t s  
  
 |   N a m e   |   D e s c r i p t i o n   |   T y p e   |   D e f a u l t   |   R e q u i r e d   |  
 | - - - - - - | - - - - - - - - - - - - - | - - - - - - | - - - - - - - - - | - - - - - - - - - - |  
 |   < a   n a m e = " i n p u t _ l o c a t i o n " > < / a >   [ l o c a t i o n ] ( # i n p u t _ l o c a t i o n )   |   S e r v i c e   B u s   l o c a t i o n   - 	 w e s t e u r o p e / e a s t u s   |   ` a n y `   |   n / a   |   y e s   |  
 |   < a   n a m e = " i n p u t _ n a m e " > < / a >   [ n a m e ] ( # i n p u t _ n a m e )   |   S e r v i c e   B u s   n a m e   |   ` a n y `   |   n / a   |   y e s |  
 |   < a   n a m e = " i n p u t _ s h o r t _ n a m e " > < / a >   [ s h o r t _ n a m e ] ( # i n p u t _ n a m e )   |   S e r v i c e   B u s   s h o r t   n a m e   |   ` a n y `   |   n / a   |   y e s |  
 |   < a   n a m e = " i n p u t _ r e s o u r c e _ g r o u p _ n a m e " > < / a >   [ r e s o u r c e _ g r o u p _ n a m e ] ( # i n p u t _ r e s o u r c e _ g r o u p _ n a m e )   |   R e s o u r c e   g r o u p   n a m e   |   ` a n y `   |   n / a   |  
 |   < a   n a m e = " i n p u t _ s u b n e t _ i d " > < / a >   [ s u b n e t _ i d ] ( # i n p u t _ s u b n e t _ i d )   |   T h e   I D   o f   t h e   s u b n e t   t h a t   t h e   S e r v i c e   B u s   s e r v e r   w i l l   b e   c o n n e c t e d   t o .   |   ` a n y `   |   n / a   |   n o   |  
 |   < a   n a m e = " i n p u t _ c a p a c i t y " > < / a >   [ c a p a c i t y ] ( # i n p u t _ c a p a c i t y )   |   S p e c i f i e s   t h e   c a p a c i t y .   W h e n   s k u   i s   P r e m i u m ,   c a p a c i t y   c a n   b e   1 ,   2 ,   4 ,   8   o r   1 6 .   W h e n   s k u   i s   B a s i c   o r   S t a n d a r d ,   c a p a c i t y   c a n   b e   0   o n l y .   |   ` s t r i n g `   |   ` " 1 " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ d e a d _ l e t t e r i n g _ o n _ f i l t e r _ e v a l u a t i o n " > < / a >   [ d e a d _ l e t t e r i n g _ o n _ f i l t e r _ e v a l u a t i o n ] ( # i n p u t _ d e a d _ l e t t e r i n g _ o n _ f i l t e r _ e v a l u a t i o n )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   t h e   S u b s c r i p t i o n   h a s   d e a d   l e t t e r   s u p p o r t   o n   f i l t e r   e v a l u a t i o n   e x c e p t i o n s .   D e f a u l t s   t o   t r u e .   |   ` s t r i n g `   |   ` " t r u e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ d e a d _ l e t t e r i n g _ o n _ m e s s a g e _ e x p i r a t i o n " > < / a >   [ d e a d _ l e t t e r i n g _ o n _ m e s s a g e _ e x p i r a t i o n ] ( # i n p u t _ d e a d _ l e t t e r i n g _ o n _ m e s s a g e _ e x p i r a t i o n )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   t h e   S u b s c r i p t i o n   h a s   d e a d   l e t t e r   s u p p o r t   w h e n   a   m e s s a g e   e x p i r e s .   D e f a u l t s   t o   f a l s e .   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ d u p l i c a t e _ d e t e c t i o n _ h i s t o r y _ t i m e _ w i n d o w " > < / a >   [ d u p l i c a t e _ d e t e c t i o n _ h i s t o r y _ t i m e _ w i n d o w ] ( # i n p u t _ d u p l i c a t e _ d e t e c t i o n _ h i s t o r y _ t i m e _ w i n d o w )   |   T h e   I S O   8 6 0 1   t i m e s p a n   d u r a t i o n   d u r i n g   w h i c h   d u p l i c a t e s   c a n   b e   d e t e c t e d .   D e f a u l t s   t o   1 0   m i n u t e s .   |   ` s t r i n g `   |   ` " P T 1 0 M " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ e n a b l e _ e x p r e s s " > < / a >   [ e n a b l e _ e x p r e s s ] ( # i n p u t _ e n a b l e _ e x p r e s s )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   E x p r e s s   E n t i t i e s   a r e   e n a b l e d .   A n   e x p r e s s   t o p i c   h o l d s   a   m e s s a g e   i n   m e m o r y   t e m p o r a r i l y   b e f o r e   w r i t i n g   i t   t o   p e r s i s t e n t   s t o r a g e .   D e f a u l t s   t o   f a l s e .   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ e n a b l e _ p a r t i t i o n i n g " > < / a >   [ e n a b l e _ p a r t i t i o n i n g ] ( # i n p u t _ e n a b l e _ p a r t i t i o n i n g )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   E x p r e s s   E n t i t i e s   a r e   e n a b l e d .   A n   e x p r e s s   t o p i c   h o l d s   a   m e s s a g e   i n   m e m o r y   t e m p o r a r i l y   b e f o r e   w r i t i n g   i t   t o   p e r s i s t e n t   s t o r a g e .   D e f a u l t s   t o   f a l s e .   |   ` b o o l `   |   ` f a l s e `   |   n o   |  
 |   < a   n a m e = " i n p u t _ f o r w a r d _ d e a d _ l e t t e r e d _ m e s s a g e s _ t o " > < / a >   [ f o r w a r d _ d e a d _ l e t t e r e d _ m e s s a g e s _ t o ] ( # i n p u t _ f o r w a r d _ d e a d _ l e t t e r e d _ m e s s a g e s _ t o )   |   T h e   n a m e   o f   a   Q u e u e   o r   T o p i c   t o   a u t o m a t i c a l l y   f o r w a r d   D e a d   L e t t e r   m e s s a g e s   t o .   |   ` s t r i n g `   |   ` " " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ f o r w a r d _ t o " > < / a >   [ f o r w a r d _ t o ] ( # i n p u t _ f o r w a r d _ t o )   |   T h e   n a m e   o f   a   Q u e u e   o r   T o p i c   t o   a u t o m a t i c a l l y   f o r w a r d   m e s s a g e s   t o .   |   ` s t r i n g `   |   ` " " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ i g n o r e _ m i s s i n g _ v n e t _ s e r v i c e _ e n d p o i n t " > < / a >   [ i g n o r e _ m i s s i n g _ v n e t _ s e r v i c e _ e n d p o i n t ] ( # i n p u t _ i g n o r e _ m i s s i n g _ v n e t _ s e r v i c e _ e n d p o i n t )   |   S h o u l d   t h e   S e r v i c e B u s   N a m e s p a c e   N e t w o r k   R u l e   S e t   i g n o r e   m i s s i n g   V i r t u a l   N e t w o r k   S e r v i c e   E n d p o i n t   o p t i o n   i n   t h e   S u b n e t ?   D e f a u l t s   t o   f a l s e .   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ l i s t e n " > < / a >   [ l i s t e n ] ( # i n p u t _ l i s t e n )   |   G r a n t s   l i s t e n   a c c e s s   t o   t h i s   t h i s   A u t h o r i z a t i o n   R u l e .   D e f a u l t s   t o   f a l s e   |   ` s t r i n g `   |   ` " t r u e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ l o c k _ d u r a t i o n " > < / a >   [ l o c k _ d u r a t i o n ] ( # i n p u t _ l o c k _ d u r a t i o n )   |   T h e   l o c k   d u r a t i o n   f o r   t h e   s u b s c r i p t i o n   a s   a n   I S O   8 6 0 1   d u r a t i o n .   T h e   d e f a u l t   v a l u e   i s   1   m i n u t e   o r   P T 1 M .   |   ` s t r i n g `   |   ` " P T 1 M " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ m a n a g e " > < / a >   [ m a n a g e ] ( # i n p u t _ m a n a g e )   |   G r a n t s   m a n a g e   a c c e s s   t o   t h i s   t h i s   A u t h o r i z a t i o n   R u l e .   W h e n   t h i s   p r o p e r t y   i s   t r u e   -   b o t h   l i s t e n   a n d   s e n d   m u s t   b e   t o o .   D e f a u l t s   t o   f a l s e .   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ m a x _ d e l i v e r y _ c o u n t " > < / a >   [ m a x _ d e l i v e r y _ c o u n t ] ( # i n p u t _ m a x _ d e l i v e r y _ c o u n t )   |   T h e   m a x i m u m   n u m b e r   o f   d e l i v e r i e s .   |   ` s t r i n g `   |   ` " 1 " `   |  
 |   < a   n a m e = " i n p u t _ m a x _ s i z e _ i n _ m e g a b y t e s " > < / a >   [ m a x _ s i z e _ i n _ m e g a b y t e s ] ( # i n p u t _ m a x _ s i z e _ i n _ m e g a b y t e s )   |   i n t e g e r   v a l u e   w h i c h   c o n t r o l s   t h e   s i z e   o f   m e m o r y   a l l o c a t e d   f o r   t h e   t o p i c .   |   ` s t r i n g `   |   ` " 1 0 2 4 " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ r e q u i r e s _ d u p l i c a t e _ d e t e c t i o n " > < / a >   [ r e q u i r e s _ d u p l i c a t e _ d e t e c t i o n ] ( # i n p u t _ r e q u i r e s _ d u p l i c a t e _ d e t e c t i o n )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   t h e   T o p i c   r e q u i r e s   d u p l i c a t e   d e t e c t i o n .   D e f a u l t s   t o   f a l s e .   C h a n g i n g   t h i s   f o r c e s   a   n e w   r e s o u r c e   t o   b e   c r e a t e d .   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ r e q u i r e s _ s e s s i o n " > < / a >   [ r e q u i r e s _ s e s s i o n ] ( # i n p u t _ r e q u i r e s _ s e s s i o n )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   t h i s   S u b s c r i p t i o n   s u p p o r t s   t h e   c o n c e p t   o f   a   s e s s i o n .   C h a n g i n g   t h i s   f o r c e s   a   n e w   r e s o u r c e   t o   b e   c r e a t e d .   |   ` s t r i n g `   |   ` " t r u e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s b _ i p _ w h i t e l i s t " > < / a >   [ s b _ i p _ w h i t e l i s t ] ( # i n p u t _ s b _ i p _ w h i t e l i s t )   |   S Q L   i p   w h i t e l i s t   a d d r e s s e s   |   ` s t r i n g `   |   ` " 0 . 0 . 0 . 0 " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s e n d " > < / a >   [ s e n d ] ( # i n p u t _ s e n d )   |   G r a n t s   s e n d   a c c e s s   t o   t h i s   t h i s   A u t h o r i z a t i o n   R u l e .   D e f a u l t s   t o   f a l s e   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s e r v i c e b u s _ s u b s c r i p t i o n _ d e f a u l t _ m e s s a g e _ t t l " > < / a >   [ s e r v i c e b u s _ s u b s c r i p t i o n _ d e f a u l t _ m e s s a g e _ t t l ] ( # i n p u t _ s e r v i c e b u s _ s u b s c r i p t i o n _ d e f a u l t _ m e s s a g e _ t t l )   |   T h e   D e f a u l t   m e s s a g e   t i m e s p a n   t o   l i v e   a s   a n   I S O   8 6 0 1   d u r a t i o n .   T h i s   i s   t h e   d u r a t i o n   a f t e r   w h i c h   t h e   m e s s a g e   e x p i r e s ,   s t a r t i n g   f r o m   w h e n   t h e   m e s s a g e   i s   s e n t   t o   S e r v i c e   B u s .   T h i s   i s   t h e   d e f a u l t   v a l u e   u s e d   w h e n   T i m e T o L i v e   i s   n o t   s e t   o n   a   m e s s a g e   i t s e l f .   |   ` s t r i n g `   |   ` " P T 5 M " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s e r v i c e b u s _ s u b s c r i p t i o n _ e n a b l e _ b a t c h e d _ o p e r a t i o n s " > < / a >   [ s e r v i c e b u s _ s u b s c r i p t i o n _ e n a b l e _ b a t c h e d _ o p e r a t i o n s ] ( # i n p u t _ s e r v i c e b u s _ s u b s c r i p t i o n _ e n a b l e _ b a t c h e d _ o p e r a t i o n s )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   t h e   S u b s c r i p t i o n   s u p p o r t s   b a t c h e d   o p e r a t i o n s .   D e f a u l t s   t o   f a l s e .   |   ` s t r i n g `   |   ` " t r u e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s e r v i c e b u s _ s u b s c r i p t i o n _ s t a t u s " > < / a >   [ s e r v i c e b u s _ s u b s c r i p t i o n _ s t a t u s ] ( # i n p u t _ s e r v i c e b u s _ s u b s c r i p t i o n _ s t a t u s )   |   T h e   s t a t u s   o f   t h e   S u b s c r i p t i o n .   P o s s i b l e   v a l u e s   a r e   A c t i v e , R e c e i v e D i s a b l e d ,   o r   D i s a b l e d .   D e f a u l t s   t o   A c t i v e .   |   ` s t r i n g `   |   ` " A c t i v e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s e r v i c e b u s _ t o p i c _ d e f a u l t _ m e s s a g e _ t t l " > < / a >   [ s e r v i c e b u s _ t o p i c _ d e f a u l t _ m e s s a g e _ t t l ] ( # i n p u t _ s e r v i c e b u s _ t o p i c _ d e f a u l t _ m e s s a g e _ t t l )   |   T h e   I S O   8 6 0 1   t i m e s p a n   d u r a t i o n   o f   T T L   o f   m e s s a g e s   s e n t   t o   t h i s   t o p i c   i f   n o   T T L   v a l u e   i s   s e t   o n   t h e   m e s s a g e   i t s e l f .   |   ` s t r i n g `   |   ` " P T 5 M " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s e r v i c e b u s _ t o p i c _ e n a b l e _ b a t c h e d _ o p e r a t i o n s " > < / a >   [ s e r v i c e b u s _ t o p i c _ e n a b l e _ b a t c h e d _ o p e r a t i o n s ] ( # i n p u t _ s e r v i c e b u s _ t o p i c _ e n a b l e _ b a t c h e d _ o p e r a t i o n s )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   i f   s e r v e r - s i d e   b a t c h e d   o p e r a t i o n s   a r e   e n a b l e d .   D e f a u l t s   t o   f a l s e .   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s e r v i c e b u s _ t o p i c _ n a m e s " > < / a >   [ s e r v i c e b u s _ t o p i c _ n a m e s ] ( # i n p u t _ s e r v i c e b u s _ t o p i c _ n a m e s )   |   A   l i s t   o f   t o p i c s   n a m e   |   ` l i s t ( s t r i n g ) `   |   ` [ ] `   |   y e s   |  
 |   < a   n a m e = " i n p u t _ s e r v i c e b u s _ t o p i c _ s t a t u s " > < / a >   [ s e r v i c e b u s _ t o p i c _ s t a t u s ] ( # i n p u t _ s e r v i c e b u s _ t o p i c _ s t a t u s )   |   T h e   S t a t u s   o f   t h e   S e r v i c e   B u s   T o p i c .   A c c e p t a b l e   v a l u e s   a r e   A c t i v e   o r   D i s a b l e d .   D e f a u l t s   t o   A c t i v e .   |   ` s t r i n g `   |   ` " A c t i v e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s k u " > < / a >   [ s k u ] ( # i n p u t _ s k u )   |   D e f i n e s   w h i c h   t i e r   t o   u s e .   O p t i o n s   a r e   b a s i c ,   s t a n d a r d   o r   p r e m i u m .   C h a n g i n g   t h i s   f o r c e s   a   n e w   r e s o u r c e   t o   b e   c r e a t e d .   |   ` s t r i n g `   |   ` " S t a n d a r d " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ s u p p o r t _ o r d e r i n g " > < / a >   [ s u p p o r t _ o r d e r i n g ] ( # i n p u t _ s u p p o r t _ o r d e r i n g )   |   B o o l e a n   f l a g   w h i c h   c o n t r o l s   w h e t h e r   t h e   T o p i c   s u p p o r t s   o r d e r i n g .   D e f a u l t s   t o   f a l s e .   |   ` s t r i n g `   |   ` " f a l s e " `   |   n o   |  
 |   < a   n a m e = " i n p u t _ t a g s " > < / a >   [ t a g s ] ( # i n p u t _ t a g s )   |   A   m a p p i n g   o f   t a g s   t o   a s s i g n   t o   S e r v i c e   B u s   |   ` m a p `   |   ` { } `   |  
 |   < a   n a m e = " i n p u t _ z o n e _ r e d u n d a n t " > < / a >   [ z o n e _ r e d u n d a n t ] ( # i n p u t _ z o n e _ r e d u n d a n t )   |   W h e t h e r   o r   n o t   t h i s   r e s o u r c e   i s   z o n e   r e d u n d a n t .   s k u   n e e d s   t o   b e   P r e m i u m .   D e f a u l t s   t o   f a l s e .   |   ` b o o l `   |   ` f a l s e `   |   n o   |  
  
  
  
 # #   O u t p u t s  
  
 |   N a m e   |   D e s c r i p t i o n   |  
 | - - - - - - | - - - - - - - - - - - - - |  
 |   < a   n a m e = " o u t p u t _ s b _ i d " > < / a >   [ s b _ i d ] ( # o u t p u t _ s b _ i d )   |   T h e   S e r v i c e B u s   N a m e s p a c e   I D   |  
 |   < a   n a m e = " o u t p u t _ s b _ l o c a t i o n " > < / a >   [ s b _ l o c a t i o n ] ( # o u t p u t _ s b _ l o c a t i o n )   |   T h e   S e r v i c e B u s   N a m e s p a c e   L o c a t i o n   |  
 |   < a   n a m e = " o u t p u t _ s b _ n a m e " > < / a >   [ s b _ n a m e ] ( # o u t p u t _ s b _ n a m e )   |   T h e   S e r v i c e B u s   N a m e s p a c e   N a m e   |  
 |   < a   n a m e = " o u t p u t _ s b _ s u b s c r i p t i o n _ i d s " > < / a >   [ s b _ s u b s c r i p t i o n _ i d s ] ( # o u t p u t _ s b _ s u b s c r i p t i o n _ i d s )   |   T h e   S e r v i c e B u s   S u b s c r i p t i o n   I d s   |  
 |   < a   n a m e = " o u t p u t _ s b _ s u b s c r i p t i o n _ n a m e s " > < / a >   [ s b _ s u b s c r i p t i o n _ n a m e s ] ( # o u t p u t _ s b _ s u b s c r i p t i o n _ n a m e s )   |   T h e   S e r v i c e B u s   S u b s c r i p t i o n   N a m e s   |  
 |   < a   n a m e = " o u t p u t _ s b _ t o p i c _ i d s " > < / a >   [ s b _ t o p i c _ i d s ] ( # o u t p u t _ s b _ t o p i c _ i d s )   |   T h e   S e r v i c e B u s   T o p i c s   I d s   |  
 |   < a   n a m e = " o u t p u t _ s b _ t o p i c _ n a m e s " > < / a >   [ s b _ t o p i c _ n a m e s ] ( # o u t p u t _ s b _ t o p i c _ n a m e s )   |   T h e   S e r v i c e B u s   T o p i c s   N a m e s   |  
  
  
 # #   C h a n g e l o g  
  
 # # #   v   0 . 0 . 1   2 0 2 1 - 0 5 - 0 6  
  
 *   I n i t i a l   v e r s i o n 
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_namespace.servicebus](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_namespace_network_rule_set.servicebus_namespace_network_rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace_network_rule_set) | resource |
| [azurerm_servicebus_subscription.servicebus_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_topic.servicebus_topic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_topic) | resource |
| [azurerm_servicebus_topic_authorization_rule.servicebus_topic_authorization_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_topic_authorization_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only. | `string` | `"1"` | no |
| <a name="input_create_servicebus"></a> [create\_servicebus](#input\_create\_servicebus) | Create ServiceBus | `bool` | `true` | no |
| <a name="input_dead_lettering_on_filter_evaluation_error"></a> [dead\_lettering\_on\_filter\_evaluation\_error](#input\_dead\_lettering\_on\_filter\_evaluation\_error) | Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true. | `string` | `"true"` | no |
| <a name="input_dead_lettering_on_message_expiration"></a> [dead\_lettering\_on\_message\_expiration](#input\_dead\_lettering\_on\_message\_expiration) | Boolean flag which controls whether the Subscription has dead letter support when a message expires. Defaults to false. | `string` | `"false"` | no |
| <a name="input_duplicate_detection_history_time_window"></a> [duplicate\_detection\_history\_time\_window](#input\_duplicate\_detection\_history\_time\_window) | The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes. | `string` | `"PT10M"` | no |
| <a name="input_enable_express"></a> [enable\_express](#input\_enable\_express) | Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false. | `string` | `"false"` | no |
| <a name="input_enable_partitioning"></a> [enable\_partitioning](#input\_enable\_partitioning) | Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false. | `bool` | `false` | no |
| <a name="input_forward_dead_lettered_messages_to"></a> [forward\_dead\_lettered\_messages\_to](#input\_forward\_dead\_lettered\_messages\_to) | The name of a Queue or Topic to automatically forward Dead Letter messages to. | `string` | `""` | no |
| <a name="input_forward_to"></a> [forward\_to](#input\_forward\_to) | The name of a Queue or Topic to automatically forward messages to. | `string` | `""` | no |
| <a name="input_ignore_missing_vnet_service_endpoint"></a> [ignore\_missing\_vnet\_service\_endpoint](#input\_ignore\_missing\_vnet\_service\_endpoint) | Should the ServiceBus Namespace Network Rule Set ignore missing Virtual Network Service Endpoint option in the Subnet? Defaults to false. | `string` | `"false"` | no |
| <a name="input_listen"></a> [listen](#input\_listen) | Grants listen access to this this Authorization Rule. Defaults to false | `string` | `"true"` | no |
| <a name="input_location"></a> [location](#input\_location) | Service Bus location -	westeurope/eastus | `any` | n/a | yes |
| <a name="input_lock_duration"></a> [lock\_duration](#input\_lock\_duration) | The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or PT1M. | `string` | `"PT1M"` | no |
| <a name="input_manage"></a> [manage](#input\_manage) | Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false. | `string` | `"false"` | no |
| <a name="input_max_delivery_count"></a> [max\_delivery\_count](#input\_max\_delivery\_count) | The maximum number of deliveries. | `string` | `"1"` | no |
| <a name="input_max_size_in_megabytes"></a> [max\_size\_in\_megabytes](#input\_max\_size\_in\_megabytes) | integer value which controls the size of memory allocated for the topic. | `string` | `"1024"` | no |
| <a name="input_name"></a> [name](#input\_name) | Service Bus name | `any` | n/a | yes |
| <a name="input_requires_duplicate_detection"></a> [requires\_duplicate\_detection](#input\_requires\_duplicate\_detection) | Boolean flag which controls whether the Topic requires duplicate detection. Defaults to false. Changing this forces a new resource to be created. | `string` | `"false"` | no |
| <a name="input_requires_session"></a> [requires\_session](#input\_requires\_session) | Boolean flag which controls whether this Subscription supports the concept of a session. Changing this forces a new resource to be created. | `string` | `"true"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_sb_ip_whitelist"></a> [sb\_ip\_whitelist](#input\_sb\_ip\_whitelist) | SQL ip whitelist addresses | `string` | `"0.0.0.0"` | no |
| <a name="input_send"></a> [send](#input\_send) | Grants send access to this this Authorization Rule. Defaults to false | `string` | `"false"` | no |
| <a name="input_servicebus_subscription_default_message_ttl"></a> [servicebus\_subscription\_default\_message\_ttl](#input\_servicebus\_subscription\_default\_message\_ttl) | The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself. | `string` | `"PT5M"` | no |
| <a name="input_servicebus_subscription_enable_batched_operations"></a> [servicebus\_subscription\_enable\_batched\_operations](#input\_servicebus\_subscription\_enable\_batched\_operations) | Boolean flag which controls whether the Subscription supports batched operations. Defaults to false. | `string` | `"true"` | no |
| <a name="input_servicebus_subscription_status"></a> [servicebus\_subscription\_status](#input\_servicebus\_subscription\_status) | The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active. | `string` | `"Active"` | no |
| <a name="input_servicebus_topic_default_message_ttl"></a> [servicebus\_topic\_default\_message\_ttl](#input\_servicebus\_topic\_default\_message\_ttl) | The ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself. | `string` | `"PT5M"` | no |
| <a name="input_servicebus_topic_enable_batched_operations"></a> [servicebus\_topic\_enable\_batched\_operations](#input\_servicebus\_topic\_enable\_batched\_operations) | Boolean flag which controls if server-side batched operations are enabled. Defaults to false. | `string` | `"false"` | no |
| <a name="input_servicebus_topic_names"></a> [servicebus\_topic\_names](#input\_servicebus\_topic\_names) | A list of topics name | `list(string)` | `[]` | no |
| <a name="input_servicebus_topic_status"></a> [servicebus\_topic\_status](#input\_servicebus\_topic\_status) | The Status of the Service Bus Topic. Acceptable values are Active or Disabled. Defaults to Active. | `string` | `"Active"` | no |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | Service Bus short name | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Defines which tier to use. Options are basic, standard or premium. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet that the Service Bus server will be connected to. | `any` | n/a | yes |
| <a name="input_support_ordering"></a> [support\_ordering](#input\_support\_ordering) | Boolean flag which controls whether the Topic supports ordering. Defaults to false. | `string` | `"false"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to Service Bus | `map` | `{}` | no |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sb_id"></a> [sb\_id](#output\_sb\_id) | The ServiceBus Namespace ID |
| <a name="output_sb_location"></a> [sb\_location](#output\_sb\_location) | The ServiceBus Namespace Location |
| <a name="output_sb_name"></a> [sb\_name](#output\_sb\_name) | The ServiceBus Namespace Name |
| <a name="output_sb_subscription_ids"></a> [sb\_subscription\_ids](#output\_sb\_subscription\_ids) | The ServiceBus Subscription Ids |
| <a name="output_sb_subscription_names"></a> [sb\_subscription\_names](#output\_sb\_subscription\_names) | The ServiceBus Subscription Names |
| <a name="output_sb_topic_ids"></a> [sb\_topic\_ids](#output\_sb\_topic\_ids) | The ServiceBus Topics Ids |
| <a name="output_sb_topic_names"></a> [sb\_topic\_names](#output\_sb\_topic\_names) | The ServiceBus Topics Names |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
