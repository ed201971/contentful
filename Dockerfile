FROM node:13.13.0 as build

ENV CONTENTFUL_ACCESS_TOKEN=qavo-1PKgFpwDezlksWWvjqNFSvYVQWtsCaEd1PRmgg
ENV CONTENTFUL_SPACE_ID=eiatt8izf8cl
ENV PATH /contentful/node_modules/.bin:$PATH
ENV GATSBY_EXPERIMENTAL_PAGE_BUILD_ON_DATA_CHANGES=true

RUN git clone https://github.com/ed201971/contentful.git
WORKDIR /contentful
RUN npm install gatsby@2.25.4
RUN npm install -g
RUN gatsby build --log-pages && exit 0 

FROM nginx:alpine
COPY --from=build /contentful/public /usr/share/nginx/html
