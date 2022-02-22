function h = drawBox3d(box, varargin)
%DRAWBOX3D Draw a 3D box defined by coordinate extents
%   
%   drawBox3d(BOX);
%   Draw a box defined by its coordinate extents: 
%   BOX = [XMIN XMAX YMIN YMAX ZMIN ZMAX].
%   The function draws only the outline edges of the box.
%
%   Example
%     % Draw bounding box of a cubeoctehedron
%     [v e f] = createCubeOctahedron;
%     box3d = boundingBox3d(v);
%     figure; hold on;
%     drawMesh(v, f);
%     drawBox3d(box3d);
%     set(gcf, 'renderer', 'opengl')
%     axis([-2 2 -2 2 -2 2]);
%     view(3)
%
%   See Also:
%   boxes3d, boundingBox3d
%
%   ---------
%   author : David Legland 
%   INRA - TPV URPOI - BIA IMASTE
%   created the 10/12/2003.
%

% HISTORY
% 2010-02-22 creation


% default values

xmin = box(:,1);
xmax = box(:,2);
ymin = box(:,3);
ymax = box(:,4);
zmin = box(:,5);
zmax = box(:,6);

nBoxes = size(box, 1);
h = zeros([length(nBoxes), 12]);
for i=1:length(nBoxes)
    % lower face (z=zmin)
    h(i, 1) = drawEdge3d([xmin(i) ymin(i) zmin(i)     xmax(i) ymin(i) zmin(i)], varargin{:});
    h(i, 2) = drawEdge3d([xmin(i) ymin(i) zmin(i)     xmin(i) ymax(i) zmin(i)], varargin{:});
    h(i, 3) = drawEdge3d([xmax(i) ymin(i) zmin(i)     xmax(i) ymax(i) zmin(i)], varargin{:});
    h(i, 4) = drawEdge3d([xmin(i) ymax(i) zmin(i)     xmax(i) ymax(i) zmin(i)], varargin{:});
 
    % front face (y=ymin)
    h(i, 5) = drawEdge3d([xmin(i) ymin(i) zmin(i)     xmin(i) ymin(i) zmax(i)], varargin{:});
    h(i, 6) = drawEdge3d([xmax(i) ymin(i) zmin(i)     xmax(i) ymin(i) zmax(i)], varargin{:});
    h(i, 7) = drawEdge3d([xmin(i) ymin(i) zmax(i)     xmax(i) ymin(i) zmax(i)], varargin{:});

    % left face (x=xmin)
    h(i, 8) = drawEdge3d([xmin(i) ymax(i) zmin(i)     xmin(i) ymax(i) zmax(i)], varargin{:});
    h(i, 9) = drawEdge3d([xmin(i) ymin(i) zmax(i)     xmin(i) ymax(i) zmax(i)], varargin{:});

    % the last 3 remaining edges
    h(i, 10) = drawEdge3d([xmin(i) ymax(i) zmax(i)     xmax(i) ymax(i) zmax(i)], varargin{:});
    h(i, 11) = drawEdge3d([xmax(i) ymax(i) zmin(i)     xmax(i) ymax(i) zmax(i)], varargin{:});
    h(i, 12) = drawEdge3d([xmax(i) ymin(i) zmax(i)     xmax(i) ymax(i) zmax(i)], varargin{:});

end
